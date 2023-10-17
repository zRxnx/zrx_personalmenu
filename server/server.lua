CORE = exports.zrx_utility:GetUtility()
COOLDOWN, PLAYER_CACHE = {}, {}
local GetPlayers = GetPlayers
local GetPlayerPing = GetPlayerPing

RegisterNetEvent('zrx_utility:bridge:playerLoaded', function(player, xPlayer, isNew)
    PLAYER_CACHE[player] = CORE.Server.GetPlayerCache(player)
end)

CreateThread(function()
    if Config.CheckForUpdates then
        CORE.Server.CheckVersion('zrx_personalmenu')
    end

    MySQL.Sync.execute([[
        CREATE Table IF NOT EXISTS `zrx_personalmenu` (
            `identifier` varchar(255) DEFAULT NULL,
            `data` longtext DEFAULT NULL,
            PRIMARY KEY (`identifier`)
        ) ENGINE=InnoDB;
    ]])

    for i, player in pairs(GetPlayers()) do
        player = tonumber(player)
        PLAYER_CACHE[player] = CORE.Server.GetPlayerCache(player)
    end
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
    local response = MySQL.query.await('SELECT `data` FROM `zrx_personalmenu` WHERE `identifier` = ?', {
        PLAYER_CACHE[player].license
    })

    if response[1] then
        local OUTPUT = {}
        local data = json.decode(response[1].data)

        for k, data2 in pairs(data) do
            OUTPUT[#OUTPUT + 1] = {
                name = data2.name,
                coords = vector3(data2.coords.x, data2.coords.y, data2.coords.z),
                street = data2.street
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

    local xPlayer, xTarget = CORE.Bridge.getVariable(source), CORE.Bridge.getVariable(target)

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

RegisterNetEvent('zrx_personalmenu:server:manageNavigation', function(action, name, coords, street, old)
    local player = source
    if action ~= 'edit' and action ~= 'create' and action ~= 'delete' or
    type(action) ~= 'string' and type(coords) ~= 'string' and type(street) ~= 'string' then
        return Config.PunishPlayer(player, 'Tried to trigger "zrx_personalmenu:server:manageNavigation"')
    end

    local DATA = {}
    local response = MySQL.query.await('SELECT `data` FROM `zrx_personalmenu` WHERE `identifier` = ?', {
        PLAYER_CACHE[player].license
    })

    if action == 'edit' or action == 'create' then
        DATA[#DATA + 1] = {
            name = name[1],
            coords = coords,
            street = street,
        }

        if action == 'create' then
            if Webhook.Links.createNav:len() > 0 then
                local message = ([[
                    The player created a navigation
        
                    Name: **%s**
                    Coords: **%s**
                    Street: **%s**
                ]]):format(name, coords, street)

                CORE.Server.DiscordLog(player, 'CREATE NAVIGATION', message, Webhook.Links.createNav)
            end

            CORE.Bridge.notification(player, 'You made a new navigation point')
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
                ]]):format(name, coords, street, old.name, old.coords, old.street)

                CORE.Server.DiscordLog(player, 'EDIT NAVIGATION', message, Webhook.Links.editNav)
            end

            CORE.Bridge.notification(player, 'You edited a navigation point')
        end

        if response[1] then
            local data = json.decode(response[1].data)

            if old then
                for k, data2 in pairs(data) do
                    if data2.name ~= old.name and data2.coords ~= old.coords and data2.street ~= old.street then
                        DATA[#DATA + 1] = {
                            name = data2.name,
                            coords = data2.coords,
                            street = data2.street
                        }
                    end
                end
            else
                for k, data2 in pairs(data) do
                    DATA[#DATA + 1] = {
                        name = data2.name,
                        coords = data2.coords,
                        street = data2.street
                    }
                end
            end

            MySQL.update.await('UPDATE zrx_personalmenu SET data = ? WHERE identifier = ?', {
                json.encode(DATA), PLAYER_CACHE[player].license
            })
        else
            MySQL.insert.await('INSERT INTO `zrx_personalmenu` (identifier, data) VALUES (?, ?)', {
                PLAYER_CACHE[player].license, json.encode(DATA)
            })
        end
    elseif action == 'delete' then
        local data = json.decode(response[1].data)

        for k, data2 in pairs(data) do
            if data2.name ~= name and data2.coords ~= coords and data2.street ~= street then
                DATA[#DATA + 1] = {
                    name = data2.name,
                    coords = data2.coords,
                    street = data2.street
                }
            end

            MySQL.update.await('UPDATE zrx_personalmenu SET data = ? WHERE identifier = ?', {
                json.encode(DATA), PLAYER_CACHE[player].license
            })
        end

        if Webhook.Links.deleteNav:len() > 0 then
            local message = ([[
                The player deleted a navigation
    
                Name: **%s**
                Coords: **%s**
                Street: **%s**
            ]]):format(name, coords, street)

            CORE.Server.DiscordLog(player, 'DELETE NAVIGATION', message, Webhook.Links.deleteNav)
        end

        CORE.Bridge.notification(player, 'You delete the navigation point')
    end
end)

RegisterNetEvent('zrx_personalmenu:server:giveCar', function(target, plate)
    if not target or not plate then return end
	local xPlayer = CORE.Bridge.getVariable(source)
    local row = MySQL.single.await('SELECT `plate`, `owner` FROM `owned_vehicles` WHERE `plate` = ? LIMIT 1', { plate })

    if row?.plate == plate and row?.owner == xPlayer.identifier then
        local xTarget = CORE.Bridge.getVariable(target)

        MySQL.update.await('UPDATE `owned_vehicles` SET `owner` = ? WHERE `plate` = ?', { xTarget.identifier, plate })

        Config.RemoveVehicleKeys(xPlayer.player, plate)
        Config.GiveVehicleKeys(xTarget.player, plate)

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