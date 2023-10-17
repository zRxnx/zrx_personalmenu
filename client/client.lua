CORE = exports.zrx_utility:GetUtility()
COOLDOWN, DATA_BLIP, DATA_ROUTE, DATA_CLOTHING = false, {}, {}, {}
DATA_ROUTE.coords = {}
local GetEntityCoords = GetEntityCoords
local SetBlipRoute = SetBlipRoute
local RemoveBlip = RemoveBlip
local vector3 = vector3
local Wait = Wait

CORE.Client.RegisterKeyMappingCommand(Config.Command, Strings.cmd_desc, Config.Key, function()
    OpenMainMenu()
end)

AddEventHandler('onResourceStop', function(res)
    if res ~= GetCurrentResourceName() then return end
    if not Config.Menu.clothe then return end

    if DATA_CLOTHING?.arms?.state then
        SetPedComponentVariation(cache.ped, 3, DATA_CLOTHING.arms.drawable, DATA_CLOTHING.arms.texture, 2)
    end

    if DATA_CLOTHING?.torso?.state then
        SetPedComponentVariation(cache.ped, 11, DATA_CLOTHING.torso.drawable, DATA_CLOTHING.torso.texture, 2)
    end

    if DATA_CLOTHING?.shirt?.state then
        SetPedComponentVariation(cache.ped, 8, DATA_CLOTHING.shirt.drawable, DATA_CLOTHING.shirt.texture, 2)
    end

    if DATA_CLOTHING?.mask?.state then
        SetPedComponentVariation(cache.ped, 1, DATA_CLOTHING.mask.drawable, DATA_CLOTHING.mask.texture, 2)
    end

    if DATA_CLOTHING?.pants?.state then
        SetPedComponentVariation(cache.ped, 4, DATA_CLOTHING.pants.drawable, DATA_CLOTHING.pants.texture, 2)
    end

    if DATA_CLOTHING?.bag?.state then
        SetPedComponentVariation(cache.ped, 5, DATA_CLOTHING.bag.drawable, DATA_CLOTHING.bag.texture, 2)
    end

    if DATA_CLOTHING?.shoes?.state then
        SetPedComponentVariation(cache.ped, 6, DATA_CLOTHING.shoes.drawable, DATA_CLOTHING.shoes.texture, 2)
    end

    if DATA_CLOTHING?.vest?.state then
        SetPedComponentVariation(cache.ped, 9, DATA_CLOTHING.vest.drawable, DATA_CLOTHING.vest.texture, 2)
    end

    if DATA_CLOTHING?.neck?.state then
        SetPedComponentVariation(cache.ped, 7, DATA_CLOTHING.neck.drawable, DATA_CLOTHING.neck.texture, 2)
    end

    if DATA_CLOTHING?.hat?.state then
        SetPedPropIndex(cache.ped, 0, DATA_CLOTHING.hat.drawable, DATA_CLOTHING.hat.texture, true)
    end

    if DATA_CLOTHING?.glass?.state then
        SetPedPropIndex(cache.ped, 1, DATA_CLOTHING.glass.drawable, DATA_CLOTHING.glass.texture, true)
    end

    if DATA_CLOTHING?.ears?.state then
        SetPedPropIndex(cache.ped, 2, DATA_CLOTHING.ears.drawable, DATA_CLOTHING.ears.texture, true)
    end

    if DATA_CLOTHING?.watch?.state then
        SetPedPropIndex(cache.ped, 6, DATA_CLOTHING.watch.drawable, DATA_CLOTHING.watch.texture, true)
    end

    if DATA_CLOTHING?.bracelets?.state then
        SetPedPropIndex(cache.ped, 7, DATA_CLOTHING.bracelets.drawable, DATA_CLOTHING.bracelets.texture, true)
    end
end)

CreateThread(function()
    local pedCoords
    while true do
        pedCoords = GetEntityCoords(cache.ped)
        for k, data in pairs(DATA_BLIP) do
            if data.time == 0 then
                RemoveDestionation(k)

                CORE.Bridge.notification(Strings.navi_timeout)
            elseif #(vector3(data.coords.x, data.coords.y, pedCoords.z) - vector3(pedCoords.x, pedCoords.y, pedCoords.z)) < Config.Navigation.checkDistance then
                RemoveDestionation(k)

                CORE.Bridge.notification(Strings.navi_reached)
            else
                DATA_BLIP[k].time -= 1
            end
        end

        Wait(1000)
    end
end)

exports('openMenu', function()
    OpenMainMenu()
end)
exports('hasCooldown', function()
    return COOLDOWN
end)
exports('getConfig', function()
    return Config
end)