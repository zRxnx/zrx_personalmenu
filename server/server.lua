---@diagnostic disable: cast-local-type, need-check-nil
CORE = exports.zrx_utility:GetUtility()
COOLDOWN, PLAYER_CACHE = {}, {}
local GetPlayers = GetPlayers
local GetPlayerPing = GetPlayerPing
local vector3 = vector3

RegisterNetEvent('zrx_utility:bridge:playerLoaded', function(player, xPlayer, isNew)
    PLAYER_CACHE[player] = CORE.Server.GetPlayerCache(player)
end)

CreateThread(function()
    if Config.CheckForUpdates then
        CORE.Server.CheckVersion('zrx_personalmenu')
    end

    MySQL.Sync.execute([[
        CREATE Table IF NOT EXISTS `zrx_personalmenu` (
            `id` int(100) NOT NULL AUTO_INCREMENT,
            `identifier` varchar(255) DEFAULT NULL,
            `data` longtext DEFAULT NULL,
            PRIMARY KEY (`id`)
        ) ENGINE=InnoDB;
    ]])

    for i, player in pairs(GetPlayers()) do
        player = tonumber(player)
        PLAYER_CACHE[player] = CORE.Server.GetPlayerCache(player)
    end
end)

lib.callback.register('zrx_personalmenu:server:getImageWebhook', function()
    return Webhook.Links.imageStorage
end)

lib.callback.register('zrx_personalmenu:server:getPlayerData', function(player)
    if Player.HasCooldown(player) then return {} end
    local xPlayer = CORE.Bridge.getVariables(player)

    if Webhook.Links.callback:len() > 0 then
        local message = [[
            The player requested their data
        ]]

        CORE.Server.DiscordLog(xPlayer.player, 'PLAYERDATA', message, Webhook.Links.callback)
    end

    return {
        job = xPlayer.job,
        name = xPlayer.name,
        dob = xPlayer.dob,
        height = xPlayer.height,
        bank = CORE.Bridge.getAccount(xPlayer.player, Config.Accounts.bank).money,
        money = CORE.Bridge.getAccount(xPlayer.player, Config.Accounts.money).money,
        black_money = CORE.Bridge.getAccount(xPlayer.player, Config.Accounts.black_money).money,
        ping = GetPlayerPing(xPlayer.player)
    }
end)

lib.callback.register('zrx_personalmenu:server:getPlayerBills', function(player)
    if Player.HasCooldown(player) then return {} end
    if Webhook.Links.callback:len() > 0 then
        local message = [[
            The player requested their bills
        ]]

        CORE.Server.DiscordLog(player, 'BILLS', message, Webhook.Links.callback)
    end

    return CORE.Bridge.getBills(player)
end)

lib.callback.register('zrx_personalmenu:server:getPlayerLicenses', function(player)
    if Player.HasCooldown(player) then return {} end
    if Webhook.Links.callback:len() > 0 then
        local message = [[
            The player requested their licenses
        ]]

        CORE.Server.DiscordLog(player, 'LICENSES', message, Webhook.Links.callback)
    end

    return CORE.Bridge.getLicenses(player)
end)

lib.callback.register('zrx_personalmenu:server:getSocietyData', function(player, job)
    if Player.HasCooldown(player) then return {} end
    if Webhook.Links.callback:len() > 0 then
        local message = ([[
            The player requested society data

            Society: **%s**
        ]]):format(job)

        CORE.Server.DiscordLog(player, 'SOCIETY', message, Webhook.Links.callback)
    end

    return {
        money = CORE.Bridge.getSocietyMoney(job)
    }
end)

lib.callback.register('zrx_personalmenu:server:getPlayerNavigation', function(player)
    if Player.HasCooldown(player) then return {} end
    local response = MySQL.query.await('SELECT `id`, `data` FROM `zrx_personalmenu` WHERE `identifier` = ?', {
        PLAYER_CACHE[player].license
    })

    if response[1] then
        local OUTPUT = {}
        local data2

        for i, data in pairs(response) do
            data2 = json.decode(data.data)

            OUTPUT[i] = {
                id = data.id,
                name = data2.name,
                coords = vector3(data2.coords.x, data2.coords.y, data2.coords.z),
                street = data2.street,
                image = data2.image
            }
        end

        return OUTPUT
    else
        return {}
    end
end)

RegisterNetEvent('zrx_personalmenu:server:managePlayer', function(target, action)
    action = action:lower()
    if action ~= 'hire' and action ~= 'fire' and action ~= 'promote' and action ~= 'derank' or type(target) ~= 'number' or source == target then
        return Config.PunishPlayer(source, 'Tried to trigger "zrx_personalmenu:server:managePlayer"')
    end

    local xPlayer, xTarget = CORE.Bridge.getVariables(source), CORE.Bridge.getVariables(target)

    if action == 'hire' then
        Player.Hire(xPlayer, xTarget)
    elseif action == 'fire' then
        Player.Fire(xPlayer, xTarget)
    elseif action == 'promote' then
        Player.Promote(xPlayer, xTarget)
    elseif action == 'derank' then
        Player.Derank(xPlayer, xTarget)
    end
end)

RegisterNetEvent('zrx_personalmenu:server:manageNavigation', function(action, data, old)
    local player = source
    if action ~= 'edit' and action ~= 'create' and action ~= 'delete' or
    type(action) ~= 'string' and type(data.coords) ~= 'string' and type(data.street) ~= 'string' then
        return Config.PunishPlayer(player, 'Tried to trigger "zrx_personalmenu:server:manageNavigation"')
    end

    if action == 'create' then
        if Webhook.Links.createNav:len() > 0 then
            local message = ([[
                The player created a navigation
    
                Name: **%s**
                Coords: **%s**
                Street: **%s**
            ]]):format(data.name, data.coords, data.street)

            CORE.Server.DiscordLog(player, 'CREATE NAVIGATION', message, Webhook.Links.createNav)
        end

        CORE.Bridge.notification(player, Strings.navi_created)

        MySQL.insert.await('INSERT INTO `zrx_personalmenu` (identifier, data) VALUES (?, ?)', {
            PLAYER_CACHE[player].license, json.encode(data)
        })
    elseif action == 'edit' then
        if Webhook.Links.editNav:len() > 0 then
            local message = ([[
                The player edited a navigation
    
                New
                Name: **%s**
                Coords: **%s**
                Street: **%s**

                Old
                Name: **%s**
                Coords: **%s**
                Street: **%s**
            ]]):format(data.name, data.coords, data.street, old.name, old.coords, old.street)

            CORE.Server.DiscordLog(player, 'EDIT NAVIGATION', message, Webhook.Links.editNav)
        end

        CORE.Bridge.notification(player, Strings.navi_edited)

        MySQL.update.await('UPDATE zrx_personalmenu SET data = ? WHERE id = ?', {
            json.encode(data), old.id
        })
    elseif action == 'delete' then
        if Webhook.Links.deleteNav:len() > 0 then
            local message = ([[
                The player deleted a navigation
    
                Name: **%s**
                Coords: **%s**
                Street: **%s**
            ]]):format(data.name, data.coords, data.street)

            CORE.Server.DiscordLog(player, 'DELETE NAVIGATION', message, Webhook.Links.deleteNav)
        end

        CORE.Bridge.notification(player, Strings.navi_deleted)

        MySQL.update.await('DELETE FROM `zrx_personalmenu` WHERE `id` = ?', {
            old.id
        })
    end
end)

RegisterNetEvent('zrx_personalmenu:server:giveCar', function(target, plate)
    if not target or not plate then return end
	local xPlayer = CORE.Bridge.getVariables(source)
    local row = MySQL.single.await('SELECT `plate`, `owner` FROM `owned_vehicles` WHERE `plate` = ? LIMIT 1', { plate })

    if row?.plate == plate and row?.owner == xPlayer.identifier then
        local xTarget = CORE.Bridge.getVariables(target)

        MySQL.update.await('UPDATE `owned_vehicles` SET `owner` = ? WHERE `plate` = ?', { xTarget.identifier, plate })

        Config.VehicleKeys('remove', xPlayer.player, plate)
        Config.VehicleKeys('add', xTarget.player, plate)

        CORE.Bridge.notification(xTarget.player, (Strings.give_got):format(xPlayer.name, plate))
        CORE.Bridge.notification(xPlayer.player, (Strings.give_given):format(plate, xTarget.name))

        if Webhook.Links.giveVehicle:len() > 0 then
            local message = ([[
                The player gave a vehicle to a person
    
                Player ID: **%s**
                Player Name: **%s**
                Vehicle Plate: **%s**
            ]]):format(xTarget.player, PLAYER_CACHE[xTarget.player].name, plate)

            CORE.Server.DiscordLog(xPlayer.player, 'GIVE VEHICLE', message, Webhook.Links.giveVehicle)
        end
    else
        CORE.Bridge.notification(xPlayer.player, (Strings.give_cannot):format(plate))
    end
end)

exports('hasCooldown', function(player)
    return not not COOLDOWN[PLAYER_CACHE[player].license]
end)
exports('getConfig', function()
    return Config
end)
