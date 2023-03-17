local seconds, minutes = 1000, 60000
Config = {}

--| Discord Webhook in 'server/server.lua'
Config.Command = 'personalmenu' --| Command
Config.Key = 'F5' --| Note: its a keyMapping
Config.Cooldown = 3 * seconds --| Note: Only for client > server or server > client | To disable set to 0
Config.Menu = {
    informations = true,
    settings = true,
    vehicle = true,
    bills = true,
    company = true,
    navigation = true,
    server = true
}

Config.Company = {
    default = {
        job = 'unemployed', --| Job when you get fired
        grade = 0 --| Job grade when you get fired
    }
}

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

--| Place here your Links/Informations
Config.Server = {
    { label = 'Discord', value = 'discord.gg/example' },
    { label = 'Website', value = 'www.example.com' },
}

--| Place your checks here before the personal menu opens
Config.CanOpen = function()
    return true
end

--| Place your checks here before the vehicle menu opens
Config.CanOpenExtras = function()
    return GetVehicleBodyHealth(GetVehiclePedIsIn(cache.ped, false)) >= 950 or true
end

--| Place your notification here
Config.Notification = function(source, msg)
    if IsDuplicityVersion() then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.showNotification(msg)
    else
        ESX.ShowNotification(msg)
    end
end

--| Place your esx import here
--| Change it if you know what you are doing
Config.esxImport = function()
	if IsDuplicityVersion() then
		return exports['es_extended']:getSharedObject()
	else
		return exports['es_extended']:getSharedObject()
	end
end