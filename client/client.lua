ESX, COOLDOWN = Config.esxImport(), nil
local GetEntityCoords = GetEntityCoords
local SetBlipRoute = SetBlipRoute
local RemoveBlip = RemoveBlip

RegisterNetEvent('esx:playerLoaded',function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterCommand(Config.Command, function()
    if not Config.CanOpenMenu() then return end

    OpenMainMenu()
end)
RegisterKeyMapping(Config.Command, Strings.cmd_desc, 'keyboard', Config.Key)
TriggerEvent('chat:addSuggestion', ('/%s'):format(Config.Command), Strings.cmd_desc, {})

DATA_ROUTE = {}
CreateThread(function()
    local pedCoords
    while true do
        pedCoords = GetEntityCoords(cache.ped)
        for k, data in pairs(DATA_ROUTE) do
            if data.time - 1 < 1 then
                SetBlipRoute(data.blip, false)
                RemoveBlip(data.blip)
                DATA_ROUTE[k] = nil

                Config.Notification(nil, Strings.navi_timeout)
            elseif #(vector3(data.coords.x, data.coords.y, data.coords.z) - vector3(pedCoords.x, pedCoords.y, pedCoords.z)) < Config.Navigation.checkFinish then
                SetBlipRoute(data.blip, false)
                RemoveBlip(data.blip)
                DATA_ROUTE[k] = nil

                Config.Notification(nil, Strings.navi_reached)
            else
                DATA_ROUTE[k].time -= 1
            end
        end
        Wait(1000)
    end
end)

exports('openMenu', OpenMainMenu)
exports('getCooldown', function()
    return COOLDOWN
end)
exports('getConfig', function()
    return Config
end)