ESX = Config.esxImport()
WEBHOOK = ''
WEBHOOK = Protect(WEBHOOK)

lib.callback.register('zrx_personalmenu:server:getPlayerData', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    DiscordLog(xPlayer.source, 'PLAYERDATA', ('Player %s (%s) requested their data'):format(GetPlayerName(xPlayer.source), xPlayer.source))

    return { job = xPlayer.getJob(), name = xPlayer.getName(), bank = xPlayer.getAccount('bank').money, money = xPlayer.getAccount('money').money, black_money = xPlayer.getAccount('black_money').money, ping = GetPlayerPing(xPlayer.source) }
end)

lib.callback.register('zrx_personalmenu:server:getPlayerBills', function(source)
    local xPlayer = ESX.GetPlayerFromId(source)
    local BILLS = {}
    local results = MySQL.Sync.fetchAll('SELECT * FROM billing WHERE identifier = @identifier', {
        ['@identifier'] = xPlayer.identifier
    })

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
    local results = MySQL.Sync.fetchAll('SELECT * FROM user_licenses WHERE owner = @owner', {
        ['@owner'] = xPlayer.identifier
    })
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
        PunishPlayer(source, 'Tried to trigger "zrx_personalmenu:server:managePlayer"')
        return
    elseif type(target) ~= 'number' then
        PunishPlayer(source, 'Tried to trigger "zrx_personalmenu:server:managePlayer"')
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