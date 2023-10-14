Config = {}

--| Discord Webhook in 'configuration/webhook.lua'
Config.Command = 'personalmenu' --| Command
Config.Key = 'F5' --| Note: Its a keymapping
Config.Cooldown = 3 --| Note: Only for client > server or server > client | To disable set to 0 | In seconds
Config.CheckForUpdates = true --| Check for updates?
Config.IconColor  = 'rgba(173, 216, 230, 1)' --| rgba format
Config.Menu = {
    player = true,
    clothe = true,
    idcard = true, --| Config.IdcardMenu
    vehicle = true,
    settings = true,
    bills = true,
    company = true, --| Config.Company
    navigation = true, --| Config.Navigation
    information = true, --| Config.Information
}

--| Company settings
Config.Company = {
    default = {
        job = 'unemployed', --| Job when you get fired
        grade = 0 --| Job grade when you get fired
    },

    allowedGrades = { --| grade names for company feature
        boss = true,
        co_boss = true,
    }
}

--| Navigation settings
Config.Navigation = {
    timeout = 120, --| In seconds
    checkDistance = 25, --| In GTA Units
    destinations = { --| Place here your locations
        { label = 'Police Station', coords = vector3(407.6613, -986.1854, 29.2603-0.9), icon = 'fa-solid fa-building-shield' },
        { label = 'Medical Center', coords = vector3(291.7147, -586.7615, 43.1760-0.9), icon = 'fa-solid fa-house-medical' },
        { label = 'Mechanic', coords = vector3(-377.3869, -131.3874, 38.6804-0.9), icon = 'fa-solid fa-toolbox' },
        { label = 'Meetingpoint', coords = vector3(217.9133, -850.6498, 30.1731-0.9), icon = 'fa-solid fa-location-dot' },
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
Config.Information = {
    { label = 'Discord', value = 'discord.gg/example' },
    { label = 'Website', value = 'www.example.com' },
}

--| Place here your idcard actions
Config.IdcardMenu = function(type, target)
    if type == 'idcard' then
        if target then
            TriggerServerEvent('jsfour-idcard:open', cache.serverId, target)
        else
            TriggerServerEvent('jsfour-idcard:open', cache.serverId, cache.serverId)
        end
    elseif type == 'driver' then
        if target then
            TriggerServerEvent('jsfour-idcard:open', cache.serverId, target, 'driver')
        else
            TriggerServerEvent('jsfour-idcard:open', cache.serverId, cache.serverId, 'driver')
        end
    elseif type == 'weapon' then
        if target then
            TriggerServerEvent('jsfour-idcard:open', cache.serverId, target, 'weapon')
        else
            TriggerServerEvent('jsfour-idcard:open', cache.serverId, cache.serverId, 'weapon')
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

--| Player here your labels for each license
--| Key is the type, the value is the label
Config.Licenses = {
    dmv = 'Theoretical driving test'
}

--| Place here your punish actions
Config.PunishPlayer = function(player, reason)
    if not IsDuplicityVersion() then return end
    if Webhook.Settings.punish then
        DiscordLog(player, 'PUNISH', reason, 'punish')
    end

    DropPlayer(player, reason)
end

--| Place your checks here before the personal menu opens
Config.CanOpenMenu = function()
    return ESX.IsPlayerLoaded()
end

--| Place here your checks before the vehicle menu opens
Config.CanOpenExtras = function()
    return GetVehicleBodyHealth(GetVehiclePedIsIn(cache.ped, false)) >= 950
end

--| Place here your notification
Config.Notification = function(player, msg)
    if IsDuplicityVersion() then
        TriggerClientEvent('esx:showNotification', player, msg, 'info')
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
Config.EsxImport = function()
	if IsDuplicityVersion() then
		return exports.es_extended:getSharedObject()
	else
		return exports.es_extended:getSharedObject()
	end
end