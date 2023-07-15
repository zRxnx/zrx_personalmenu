ESX = Config.esxImport()
WEBHOOK = ''

lib.callback.register('zrx_personalmenu:server:getPlayerData', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    DiscordLog(xPlayer.source, 'PLAYERDATA', ('Player %s (%s) requested their data'):format(GetPlayerName(xPlayer.source), xPlayer.source))

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
    local xPlayer = ESX.GetPlayerFromId(source)
    local results = MySQL.query.await('SELECT * FROM `billing` WHERE `identifier` = ?', { xPlayer.identifier })
    local BILLS = {}

    for k, data in pairs(results) do
        BILLS[#BILLS + 1] = {
            id = data.id,
            label = data.label,
            amount = data.amount
        }
    end
    DiscordLog(xPlayer.source, 'PLAYERBILLS', ('Player %s (%s) requested their bills'):format(GetPlayerName(xPlayer.source), xPlayer.source))

    return BILLS
end)

lib.callback.register('zrx_personalmenu:server:getPlayerLicenses', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local results = MySQL.query.await('SELECT * FROM `user_licenses` WHERE `owner` = ?', { xPlayer.identifier })
    DiscordLog(xPlayer.source, 'LICENSES', ('Player %s (%s) requested their licenses'):format(GetPlayerName(xPlayer.source), xPlayer.source))

    return results
end)

lib.callback.register('zrx_personalmenu:server:getSocietyMoney', function(source, job)
    local money
    TriggerEvent('esx_addonaccount:getSharedAccount', ('society_%s'):format(job), function(account)
        money = account.money
    end)

    return money or 0
end)

RegisterNetEvent('zrx_personalmenu:server:managePlayer', function(target, action)
    action = action:lower()
    if action ~= 'hire' and action ~= 'fire' and action ~= 'promote' and action ~= 'derank' then
        Config.PunishPlayer(source, 'Tried to trigger "zrx_personalmenu:server:managePlayer"')
        return
    elseif type(target) ~= 'number' then
        Config.PunishPlayer(source, 'Tried to trigger "zrx_personalmenu:server:managePlayer"')
        return
    elseif source == target then
        DiscordLog(source, 'MANAGEPLAYER', ('Player %s (%s) tried to manage themself'):format(GetPlayerName(xPlayer.source), xPlayer.source))
        return
    end

    local xPlayer = ESX.GetPlayerFromId(source)
    local yTarget = ESX.GetPlayerFromId(target)

    if action == 'hire' then
        Player.hire(xPlayer, yTarget)
    elseif action == 'fire' then
        Player.fire(xPlayer, yTarget)
    elseif action == 'promote' then
        Player.promote(xPlayer, yTarget)
    elseif action == 'derank' then
        Player.derank(xPlayer, yTarget)
    end
end)

RegisterNetEvent('zrx_personalmenu:server:giveCar', function(target, plate)
    if not target or not plate then return end
	local xPlayer = ESX.GetPlayerFromId(source)

    local row = MySQL.single.await('SELECT `plate` FROM `owned_vehicles` WHERE `plate` = ? LIMIT 1', { plate })

    if row?.plate == plate then
        local xTarget = ESX.GetPlayerFromId(target)

        MySQL.update.await('UPDATE `owned_vehicles` SET `owner` = ? WHERE `plate` = ?', { xTarget.identifier, plate })

        Config.GiveVehicleKeys(xTarget.source, plate)
        Config.RemoveVehicleKeys(xPlayer.source, plate)

        Config.Notification(xTarget.source, (Strings.give_got):format(xPlayer.getName(), plate))
        Config.Notification(xPlayer.source, (Strings.give_given):format(plate, xTarget.getName()))
    else
        Config.Notification(xPlayer.source, (Strings.give_cannot):format(plate))
    end
end)