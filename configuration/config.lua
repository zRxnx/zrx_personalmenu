local seconds, minutes = 1000, 60000
Config = {}

--| Discord Webhook in 'server/server.lua'
Config.Command = 'personalmenu' --| Command
Config.Key = 'F5' --| Note: Its a keymapping
Config.Cooldown = 3 * seconds --| Note: Only for client > server or server > client | To disable set to 0
Config.CheckForUpdates = true --| Check for updates?
Config.Menu = {
    informations = true,
    idcard = true, --| Config.IdcardMenu
    settings = true,
    vehicle = true,
    bills = true,
    company = true,
    navigation = true,
    server = true
}

--| Company settings
Config.Company = {
    default = {
        job = 'unemployed', --| Job when you get fired
        grade = 0 --| Job grade when you get fired
    },

    allowedGrades = { --| grade names for company feature
        ['boss'] = true,
        ['co_boss'] = true,
    }
}

--| Navigation settings
Config.Navigation = {
    timeout = 120, --| In seconds
    checkFinish = 25.0, --| In GTA Units
    destinations = { --| Place here your locations
        { label = 'Police Station', coords = vector3(407.6613, -986.1854, 29.2603-0.9) },
        { label = 'Medical Center', coords = vector3(291.7147, -586.7615, 43.1760-0.9) },
        { label = 'Mechanic', coords = vector3(-377.3869, -131.3874, 38.6804-0.9) },
        { label = 'Meetingpoint', coords = vector3(217.9133, -850.6498, 30.1731-0.9) },
    },
    route = function(coords, text) --| Change it if you know what you are doing
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)

        SetBlipSprite(blip, 38)
        SetBlipColour(blip, 0)
        SetBlipScale(blip, 1.0)
        SetBlipAlpha(blip, 255)
        SetBlipAsShortRange(blip, false)
        BeginTextCommandSetBlipName('STRING')
        AddTextComponentSubstringPlayerName(text)
        EndTextCommandSetBlipName(blip)
        SetBlipRoute(blip, true)
        SetBlipRouteColour(blip, 26)

        return blip
    end
}

--| Place here your links/informations
Config.Server = {
    { label = 'Discord', value = 'discord.gg/example' },
    { label = 'Website', value = 'www.example.com' },
}

--| Place here your idcard actions
Config.IdcardMenu = function(players, type)
    if type == 'idcard' then
        if players?.target then
            TriggerServerEvent('jsfour-idcard:open', players.author, players.target)
        else
            TriggerServerEvent('jsfour-idcard:open', players.author, players.author)
        end
    elseif type == 'driver' then
        if players?.target then
            TriggerServerEvent('jsfour-idcard:open', players.author, players.target, 'driver')
        else
            TriggerServerEvent('jsfour-idcard:open', players.author, players.author, 'driver')
        end
    elseif type == 'weapon' then
        if players?.target then
            TriggerServerEvent('jsfour-idcard:open', players.author, players.target, 'weapon')
        else
            TriggerServerEvent('jsfour-idcard:open', players.author, players.author, 'weapon')
        end
    end
end

--| Place here your account definition of ESX
--| Change it if you know what you are doing
Config.ESXAccounts = {
    bank = 'bank',
    money = 'money',
    black_money = 'black_money'
}

--| Place here your punish actions
Config.PunishPlayer = function(player, reason)
    if not IsDuplicityVersion() then return end
    DiscordLog(player, 'PUNISH', reason)
    DropPlayer(player, reason)
end

--| Place your checks here before the personal menu opens
Config.CanOpenMenu = function()
    return ESX.IsPlayerLoaded()
end

--| Place here your checks before the vehicle menu opens
Config.CanOpenExtras = function()
    return GetVehicleBodyHealth(GetVehiclePedIsIn(cache.ped, false)) >= 950 or true
end

--| Place here your notification
Config.Notification = function(player, msg)
    if IsDuplicityVersion() then
        local xPlayer = ESX.GetPlayerFromId(player)
        xPlayer.showNotification(msg)
    else
        ESX.ShowNotification(msg)
    end
end

--| Add here your give keys export
Config.GiveVehicleKeys = function(player, vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)

    if IsDuplicityVersion() then
        --| exports.wasabi_carlock:GiveKey(plate, player)
    else
        --| exports.wasabi_carlock:GiveKey(plate)
    end
end

--| Add here your remove key export
Config.RemoveVehicleKeys = function(player, vehicle)
    local plate = GetVehicleNumberPlateText(vehicle)

    if IsDuplicityVersion() then
        --| exports.wasabi_carlock:RemoveKeys(plate, player)
    else
        --| exports.wasabi_carlock:RemoveKeys(plate)
    end
end

--| Place here your esx import
--| Change it if you know what you are doing
Config.esxImport = function()
	if IsDuplicityVersion() then
		return exports['es_extended']:getSharedObject()
	else
		return exports['es_extended']:getSharedObject()
	end
end