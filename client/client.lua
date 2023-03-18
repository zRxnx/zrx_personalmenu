ESX, COOLDOWN = Config.esxImport(), nil
local GetEntityCoords = GetEntityCoords
local DisableOcclusionThisFrame = DisableOcclusionThisFrame
local SetDisableDecalRenderingThisFrame = SetDisableDecalRenderingThisFrame
local RemoveParticleFxInRange = RemoveParticleFxInRange
local OverrideLodscaleThisFrame = OverrideLodscaleThisFrame
local SetArtificialLightsState = SetArtificialLightsState
local ClearAllBrokenGlass = ClearAllBrokenGlass
local LeaderboardsReadClearAll = LeaderboardsReadClearAll
local ClearBrief = ClearBrief
local ClearGpsFlags = ClearGpsFlags
local ClearPrints = ClearPrints
local ClearSmallPrints = ClearSmallPrints
local ClearReplayStats = ClearReplayStats
local LeaderboardsClearCacheData = LeaderboardsClearCacheData
local ClearFocus = ClearFocus
local ClearHdArea = ClearHdArea
local ClearPedBloodDamage = ClearPedBloodDamage
local ClearPedWetness = ClearPedWetness
local ClearPedEnvDirt = ClearPedEnvDirt
local ResetPedVisibleDamage = ResetPedVisibleDamage
local ClearPedLastWeaponDamage = ClearPedLastWeaponDamage
local ClearExtraTimecycleModifier = ClearExtraTimecycleModifier
local ClearTimecycleModifier = ClearTimecycleModifier
local ClearOverrideWeather = ClearOverrideWeather
local DisableVehicleDistantlights = DisableVehicleDistantlights
local DisableScreenblurFade = DisableScreenblurFade
local SetRainLevel = SetRainLevel
local SetWindSpeed = SetWindSpeed

RegisterNetEvent('esx:playerLoaded',function(xPlayer)
    ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterCommand(Config.Command, function()
    if not Config.CanOpen() then return end

    OpenMainMenu()
end)
RegisterKeyMapping(Config.Command, Strings.cmd_desc, 'keyboard', Config.Key)
TriggerEvent('chat:addSuggestion', ('/%s'):format(Config.Command), Strings.cmd_desc, {})

CreateThread(function()
    local pedCoords
    ::loop::
        if DATA_SETTINGS.booster then
            pedCoords = GetEntityCoords(cache.ped)
            DisableOcclusionThisFrame()
            SetDisableDecalRenderingThisFrame()
            RemoveParticleFxInRange(vector3(pedCoords.x, pedCoords.y, pedCoords.z), 10.0)
            OverrideLodscaleThisFrame(0.4)
            SetArtificialLightsState(true)
            ClearAllBrokenGlass()
            LeaderboardsReadClearAll()
            ClearBrief()
            ClearGpsFlags()
            ClearPrints()
            ClearSmallPrints()
            ClearReplayStats()
            LeaderboardsClearCacheData()
            ClearFocus()
            ClearHdArea()
            ClearPedBloodDamage(cache.ped)
            ClearPedWetness(cache.ped)
            ClearPedEnvDirt(cache.ped)
            ResetPedVisibleDamage(cache.ped)
            ClearPedLastWeaponDamage(cache.ped)
            ClearExtraTimecycleModifier()
            ClearTimecycleModifier()
            ClearOverrideWeather()
            DisableVehicleDistantlights(false)
            DisableScreenblurFade()
            SetRainLevel(0.0)
            SetWindSpeed(0.0)
            Wait()
        else
            Wait(2000)
        end
    goto loop
end)

DATA_ROUTE = {}
CreateThread(function()
    local pedCoords
    ::loop::
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
    goto loop
end)