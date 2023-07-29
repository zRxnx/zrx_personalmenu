ESX, PLAYER_CACHE = Config.EsxImport(), {}

RegisterNetEvent('esx:playerLoaded', function(player, xPlayer, isNew)
    PLAYER_CACHE[player] = GetPlayerData(player)
end)

CreateThread(function()
    for i, data in pairs(GetPlayers()) do
        data = tonumber(data)
        PLAYER_CACHE[data] = GetPlayerData(data)
    end
end)

lib.callback.register('zrx_personalmenu:server:getPlayerData', function(source)
    if Player.HasCooldown(source) then return {} end
    local xPlayer = ESX.GetPlayerFromId(source)

    if Webhook.Settings.callback then
        DiscordLog(xPlayer.source, 'PLAYERDATA', ('Player %s (%s) requested their data'):format(PLAYER_CACHE[xPlayer.source].name, xPlayer.source), 'callback')
    end

    return {
        job = xPlayer.getJob(),
        name = xPlayer.getName(),
        dob = xPlayer.variables.dateofbirth,
        height = xPlayer.variables.height,
        bank = xPlayer.getAccount(Config.ESXAccounts.bank).money,
        money = xPlayer.getAccount(Config.ESXAccounts.money).money,
        black_money = xPlayer.getAccount(Config.ESXAccounts.black_money).money,
        ping = GetPlayerPing(xPlayer.source)
    }
end)

lib.callback.register('zrx_personalmenu:server:getPlayerBills', function(source)
    if Player.HasCooldown(source) then return {} end
    local xPlayer = ESX.GetPlayerFromId(source)
    local results = MySQL.query.await('SELECT * FROM `billing` WHERE `identifier` = ?', { xPlayer.identifier })
    local BILLS = {}

    if Webhook.Settings.callback then
        DiscordLog(xPlayer.source, 'PLAYERBILLS', ('Player %s (%s) requested their bills'):format(PLAYER_CACHE[xPlayer.source].name, xPlayer.source), 'callback')
    end

    for k, data in pairs(results) do
        BILLS[#BILLS + 1] = {
            id = data.id,
            label = data.label,
            amount = data.amount
        }
    end

    return BILLS
end)

lib.callback.register('zrx_personalmenu:server:getPlayerLicenses', function(source)
    if Player.HasCooldown(source) then return {} end
    local xPlayer = ESX.GetPlayerFromId(source)
    local results = MySQL.query.await('SELECT * FROM `user_licenses` WHERE `owner` = ?', { xPlayer.identifier })

    if Webhook.Settings.callback then
        DiscordLog(xPlayer.source, 'LICENSES', ('Player %s (%s) requested their licenses'):format(PLAYER_CACHE[xPlayer.source].name, xPlayer.source), 'callback')
    end

    return results
end)

lib.callback.register('zrx_personalmenu:server:getSocietyData', function(source, job)
    if Player.HasCooldown(source) then return {} end
    local money = promise.new()

    if Webhook.Settings.callback then
        DiscordLog(source, 'SOCIETY', ('Player %s (%s) requested %s society data'):format(PLAYER_CACHE[source].name, source, job:upper()), 'callback')
    end

    TriggerEvent('esx_addonaccount:getSharedAccount', ('society_%s'):format(job), function(account)
        money:resolve(account.money)
    end)

    return {
        money = Citizen.Await(money)
    }
end)

RegisterNetEvent('zrx_personalmenu:server:managePlayer', function(target, action)
    action = action:lower()
    if action ~= 'hire' and action ~= 'fire' and action ~= 'promote' and action ~= 'derank' then
        if Webhook.Settings.punish then
            DiscordLog(source, 'MANAGEPLAYER', ('Player %s (%s) tried to trigger "zrx_personalmenu:server:managePlayer"'):format(PLAYER_CACHE[source].name, source), 'punish')
        end

        return Config.PunishPlayer(source, 'Tried to trigger "zrx_personalmenu:server:managePlayer"')
    elseif type(target) ~= 'number' then
        if Webhook.Settings.punish then
            DiscordLog(source, 'MANAGEPLAYER', ('Player %s (%s) tried to trigger "zrx_personalmenu:server:managePlayer"'):format(PLAYER_CACHE[source].name, source), 'punish')
        end

        return Config.PunishPlayer(source, 'Tried to trigger "zrx_personalmenu:server:managePlayer"')
    elseif source == target then
        if Webhook.Settings.punish then
            DiscordLog(source, 'MANAGEPLAYER', ('Player %s (%s) tried to trigger "zrx_personalmenu:server:managePlayer"'):format(PLAYER_CACHE[source].name, source), 'punish')
        end

        return Config.PunishPlayer(source, 'Tried to trigger "zrx_personalmenu:server:managePlayer"')
    end

    local xPlayer, xTarget = ESX.GetPlayerFromId(source), ESX.GetPlayerFromId(target)

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

RegisterNetEvent('zrx_personalmenu:server:giveCar', function(target, plate)
    if not target or not plate then return end
	local xPlayer = ESX.GetPlayerFromId(source)
    local row = MySQL.single.await('SELECT `plate`, `owner` FROM `owned_vehicles` WHERE `plate` = ? LIMIT 1', { plate })

    if row?.plate == plate and row?.owner == xPlayer.identifier then
        local xTarget = ESX.GetPlayerFromId(target)

        MySQL.update.await('UPDATE `owned_vehicles` SET `owner` = ? WHERE `plate` = ?', { xTarget.identifier, plate })

        Config.RemoveVehicleKeys(xPlayer.source, plate)
        Config.GiveVehicleKeys(xTarget.source, plate)

        Config.Notification(xTarget.source, (Strings.give_got):format(xPlayer.getName(), plate))
        Config.Notification(xPlayer.source, (Strings.give_given):format(plate, xTarget.getName()))
    else
        Config.Notification(xPlayer.source, (Strings.give_cannot):format(plate))
    end
end)

exports('hasCooldown', Player.HasCooldown)
exports('getConfig', function()
    return Config
end)