---@diagnostic disable: param-type-mismatch
local RopeDrawShadowEnabled = RopeDrawShadowEnabled
local CascadeShadowsClearShadowSampleType = CascadeShadowsClearShadowSampleType
local CascadeShadowsSetAircraftMode = CascadeShadowsSetAircraftMode
local CascadeShadowsEnableEntityTracker = CascadeShadowsEnableEntityTracker
local CascadeShadowsSetDynamicDepthMode = CascadeShadowsSetDynamicDepthMode
local CascadeShadowsSetEntityTrackerScale = CascadeShadowsSetEntityTrackerScale
local CascadeShadowsSetDynamicDepthValue = CascadeShadowsSetDynamicDepthValue
local CascadeShadowsSetCascadeBoundsScale = CascadeShadowsSetCascadeBoundsScale
local SetFlashLightFadeDistance = SetFlashLightFadeDistance
local SetLightsCutoffDistanceTweak = SetLightsCutoffDistanceTweak
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
local GetPlayerName = GetPlayerName
local DoesEntityExist = DoesEntityExist
local GetPedInVehicleSeat = GetPedInVehicleSeat
local SetVehicleEngineOn = SetVehicleEngineOn
local SetVehicleUndriveable = SetVehicleUndriveable
local GetEntityCoords = GetEntityCoords
local GetPlayerServerId = GetPlayerServerId
local GetPlayerPed = GetPlayerPed
local DoesExtraExist = DoesExtraExist
local IsVehicleExtraTurnedOn = IsVehicleExtraTurnedOn
local SetVehicleExtra = SetVehicleExtra
local GetVehicleNumberPlateText = GetVehicleNumberPlateText
local GetVehicleLiveryCount = GetVehicleLiveryCount
local SetVehicleLivery = SetVehicleLivery
local SetVehicleInteriorlight = SetVehicleInteriorlight
local SetVehicleLights = SetVehicleLights
local DisableVehicleNeonLights = DisableVehicleNeonLights
local RollUpWindow = RollUpWindow
local RollDownWindow = RollDownWindow
local RollDownWindows = RollDownWindows
local SetVehicleDoorShut = SetVehicleDoorShut
local SetVehicleDoorOpen = SetVehicleDoorOpen
local SetVehicleDoorsShut = SetVehicleDoorsShut
local LoadResourceFile = LoadResourceFile
local GetCurrentResourceName = GetCurrentResourceName
local SetVisualSettingFloat = SetVisualSettingFloat
local Wait = Wait
local TriggerServerEvent = TriggerServerEvent
local vector3 = vector3
local TaskPlayAnim = TaskPlayAnim
local ClearPedTasks = ClearPedTasks
local GetPedDrawableVariation = GetPedDrawableVariation
local GetPedTextureVariation = GetPedTextureVariation
local SetPedComponentVariation = SetPedComponentVariation
local SetPedPropIndex = SetPedPropIndex
local GetPedPropIndex = GetPedPropIndex
local GetPedPropTextureIndex = GetPedPropTextureIndex
local ClearPedProp = ClearPedProp
local GetStreetNameAtCoord = GetStreetNameAtCoord
local GetStreetNameFromHashKey = GetStreetNameFromHashKey
local ClearGpsMultiRoute = ClearGpsMultiRoute
local StartGpsMultiRoute = StartGpsMultiRoute
local AddPointToGpsMultiRoute = AddPointToGpsMultiRoute
local SetGpsMultiRouteRender = SetGpsMultiRouteRender
local SetBlipRoute = SetBlipRoute
local RemoveBlip = RemoveBlip
local IsPedMale = IsPedMale
local GetResourceState = GetResourceState

local CLOTHE_DATA = {
    ComponentId = {
        --| face = 0,
        mask = 1,
        --| hair = 2,
        arms = 3,
        pants = 4,
        bag = 5,
        shoes = 6,
        neck = 7,
        shirt = 8,
        vest = 9,
        --| decals = 10,
        torso = 11,
    },

    PropId = {
        hat = 0,
        glass = 1,
        ears = 2,
        watch = 6,
        bracelets = 7,
    },

    ClotheId = {
        mask = {
            male = {
                0, 0
            },

            female = {
                0, 0
            }
        },

        arms = {
            male = {
                15, 0
            },

            female = {
                15, 0
            }
        },

        pants = {
            male = {
                21, 0
            },

            female = {
                17, 0
            }
        },

        bag = {
            male = {
                0, 0
            },

            female = {
                0, 0
            }
        },

        shoes = {
            male = {
                34, 0
            },

            female = {
                35, 0
            }
        },

        neck = {
            male = {
                0, 0
            },

            female = {
                0, 0
            }
        },

        shirt = {
            male = {
                15, 0
            },

            female = {
                14, 0
            }
        },

        vest = {
            male = {
                0, 0
            },

            female = {
                0, 0
            }
        },

        torso = {
            male = {
                15, 0
            },

            female = {
                82, 0
            }
        },
    },

    Set = {
        hat = {
            off = {
                anim = 'take_off_helmet_stand',
                dict = 'missheist_agency2ahelmet',
                duration = 1000,
            },

            on = {
                anim = 'put_on_mask',
                dict = 'mp_masks@standard_car@ds@',
                duration = 1000,
            }
        },

        glass = {
            anim = 'take_off',
            dict = 'clothingspecs',
            duration = 1000,
        },

        ears = {
            anim = 'b_think',
            dict = 'mp_cp_stolen_tut',
            duration = 1000,
        },

        watch = {
            anim = 'cs_nigel_dual-10',
            dict = 'nmt_3_rcm-10',
            duration = 1000,
        },

        bracelets = {
            anim = 'cs_nigel_dual-10',
            dict = 'nmt_3_rcm-10',
            duration = 1000,
        },

        mask = {
            anim = 'put_on_mask',
            dict = 'mp_masks@standard_car@ds@',
            duration = 800,
        },

        arms = {
            anim = 'cs_nigel_dual',
            dict = 'nmt_3_rcm-10',
            duration = 2000,
        },

        pants = {
            anim = 'out_of_breath',
            dict = 're@construction',
            duration = 1000,
        },

        bag = {
            anim = 'intro',
            dict = 'anim@heists@ornate_bank@grab_cash',
            duration = 1500,
        },

        shoes = {
            anim = 'pickup_low',
            dict = 'random@domestic',
            duration = 1500,
        },

        shirt = {
            anim = 'try_tie_negative_a',
            dict = 'clothingtie',
            duration = 1500,
        },

        vest = {
            anim = 'try_tie_negative_a',
            dict = 'clothingtie',
            duration = 1000,
        },

        torso = {
            anim = 'michael_tux_fidget',
            dict = 'missmic4',
            duration = 1500,
        },

        neck = {
            anim = 'try_tie_positive_a',
            dict = 'clothingtie',
            duration = 2000,
        }
    }
}

OpenMainMenu = function()
    if not Config.CanOpenMenu() then return end
    local MENU = {}

    if Config.Option.player then
        MENU[#MENU + 1] = {
            title = Strings.info_title,
            description = Strings.info_desc,
            arrow = true,
            icon = 'fa-solid fa-user',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenInfoMenu()
            end
        }
    end

    if Config.Option.idcard then
        MENU[#MENU + 1] = {
            title = Strings.idcard_title,
            description = Strings.idcard_desc,
            arrow = true,
            icon = 'fa-solid fa-id-card',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenIDcardMenu()
            end
        }
    end

    if Config.Option.clothe then
        MENU[#MENU + 1] = {
            title = Strings.clothe_title,
            description = Strings.clothe_desc,
            arrow = true,
            icon = 'fa-solid fa-shirt',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenClotheMenu()
            end
        }
    end

    if Config.Option.settings then
        MENU[#MENU + 1] = {
            title = Strings.setting_title,
            description = Strings.setting_desc,
            arrow = true,
            icon = 'fa-solid fa-gears',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenSettingMenu()
            end
        }
    end

    if Config.Option.vehicle then
        MENU[#MENU + 1] = {
            title = Strings.veh_title,
            description = Strings.veh_desc,
            arrow = true,
            icon = 'fa-solid fa-car',
            iconColor = Config.IconColor,
            disabled = not IsVehicleValid(),
            onSelect = function()
                OpenVehicleMenu()
            end
        }
    end

    if Config.Option.bills then
        MENU[#MENU + 1] = {
            title = Strings.bills_title,
            description = Strings.bills_desc,
            arrow = true,
            icon = 'fa-solid fa-money-bill',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenBillMenu()
            end
        }
    end

    if Config.Option.company then
        MENU[#MENU + 1] = {
            title = Strings.company_title,
            description = Strings.company_desc,
            arrow = true,
            icon = 'fa-solid fa-building',
            iconColor = Config.IconColor,
            disabled = not IsGradeAllowed(),
            onSelect = function()
                OpenCompanyMenu()
            end
        }
    end

    if Config.Option.navigation then
        MENU[#MENU + 1] = {
            title = Strings.navi_title,
            description = Strings.navi_desc,
            arrow = true,
            icon = 'fa-solid fa-compass',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenNavigationMenu()
            end
        }
    end

    if Config.Option.editor then
        MENU[#MENU + 1] = {
            title = Strings.editor_title,
            description = Strings.editor_desc,
            arrow = true,
            icon = 'fa-solid fa-pen-to-square',
            iconColor = Config.IconColor,
            onSelect = function()
                OpenEditorMenu()
            end
        }
    end

    if Config.Option.information then
        MENU[#MENU + 1] = {
            title = Strings.information_title,
            description = Strings.information_desc,
            arrow = false,
            icon = 'fa-solid fa-circle-info',
            iconColor = Config.IconColor,
            metadata = Config.Information
        }
    end

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:main',
        title = Strings.menu_main,
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenInfoMenu = function()
    local MENU = {}
    local PLAYER_DATA = lib.callback.await('zrx_personalmenu:server:getPlayerData', 500)

    if COOLDOWN or not PLAYER_DATA?.name then
        CORE.Bridge.notification(Strings.on_cooldown)
        return OpenMainMenu()
    end
    StartCooldown()

    MENU[#MENU + 1] = {
        title = Strings.player_title,
        description = (Strings.player_desc):format(cache.serverId, GetPlayerName(cache.playerId), PLAYER_DATA.ping),
        arrow = false,
        icon = 'fa-solid fa-user',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.rpname_title,
        description = (Strings.rpname_desc):format(PLAYER_DATA.name),
        arrow = false,
        icon = 'fa-solid fa-signature',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.dob_title,
        description = (Strings.dob_desc):format(PLAYER_DATA.dob),
        arrow = false,
        icon = 'fa-solid fa-calendar-days',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.height_title,
        description = (Strings.height_desc):format(PLAYER_DATA.height),
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.gender_title,
        description = (Strings.gender_desc):format(CORE.Bridge.getVariables().sex == 'm' and Strings.male or Strings.female),
        arrow = false,
        icon = 'fa-solid fa-genderless',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.job_title,
        description = (Strings.job_desc):format(PLAYER_DATA.job.label),
        arrow = false,
        icon = 'fa-solid fa-briefcase',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.job_grade_title,
        description = (Strings.job_grade_desc):format(PLAYER_DATA.job.grade_label, PLAYER_DATA.job.grade),
        arrow = false,
        icon = 'fa-solid fa-briefcase',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.bank_title,
        description = (Strings.bank_desc):format(lib.math.groupdigits(PLAYER_DATA.bank, '.')),
        arrow = false,
        icon = 'fa-solid fa-credit-card',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.money_title,
        description = (Strings.money_desc):format(lib.math.groupdigits(PLAYER_DATA.money, '.')),
        arrow = false,
        icon = 'fa-solid fa-coins',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.black_money_title,
        description = (Strings.black_money_desc):format(lib.math.groupdigits(PLAYER_DATA.black_money, '.')),
        arrow = false,
        icon = 'fa-solid fa-dollar-sign',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.lice_title,
        description = Strings.lice_desc,
        arrow = true,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenInfoLicenseMenu()
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:info',
        title = Strings.menu_info,
        menu = 'zrx_personalmenu:personal_menu:main',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenInfoLicenseMenu = function()
    local MENU = {}
    local PLAYER_LICENSES = lib.callback.await('zrx_personalmenu:server:getPlayerLicenses', 500)

    StartCooldown()

    if #PLAYER_LICENSES > 0 then
        for k, data in pairs(PLAYER_LICENSES) do
            MENU[#MENU + 1] = {
                title = Config.Licenses[data.type] or data.type:upper(),
                arrow = false,
                icon = 'fa-solid fa-id-card',
                iconColor = Config.IconColor,
                readOnly = true,
            }
        end
    else
        MENU[#MENU + 1] = {
            title = Strings.lice_no,
            description = Strings.lice_no_desc,
            arrow = false,
            icon = 'fa-solid fa-xmark',
            iconColor = Config.IconColor,
            readOnly = true,
        }
    end

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:info:licenses',
        title = Strings.menu_info_lice,
        menu = 'zrx_personalmenu:personal_menu:info',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenIDcardMenu = function()
    local MENU = {}
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    MENU[#MENU + 1] = {
        title = Strings.idcard_view_title,
        description = Strings.idcard_view_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        onSelect = function()
            Config.IdcardMenu('idcard')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.idcard_show_title,
        description = Strings.idcard_show_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            Config.IdcardMenu('idcard', nearPlayerId)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.driver_view_title,
        description = Strings.driver_view_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        onSelect = function()
            Config.IdcardMenu('driver')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.driver_show_title,
        description = Strings.driver_show_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            Config.IdcardMenu('driver', nearPlayerId)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.weapon_view_title,
        description = Strings.weapon_view_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        onSelect = function()
            Config.IdcardMenu('weapon')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.weapon_show_title,
        description = Strings.weapon_show_desc,
        arrow = false,
        icon = 'fa-solid fa-id-card',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            Config.IdcardMenu('weapon', nearPlayerId)
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:idcard',
        title = Strings.menu_idcard,
        menu = 'zrx_personalmenu:personal_menu:main',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenClotheMenu = function()
    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.reset_title,
        description = Strings.reset_desc,
        arrow = false,
        icon = 'fa-solid fa-power-off',
        iconColor = Config.IconColor,
        onSelect = function()
            DATA_CLOTHING.isRemoveDisabled = false

            ChangeComponent('reset', 'torso')
            ChangeComponent('reset', 'mask')
            ChangeComponent('reset', 'arms')
            ChangeComponent('reset', 'pants')
            ChangeComponent('reset', 'bag')
            ChangeComponent('reset', 'shoes')
            ChangeComponent('reset', 'shirt')
            ChangeComponent('reset', 'vest')
            ChangeComponent('reset', 'neck')
            ChangeProp('reset', 'hat')
            ChangeProp('reset', 'glass')
            ChangeProp('reset', 'ears')
            ChangeProp('reset', 'watch')
            ChangeProp('reset', 'bracelets')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.remove_title,
        description = Strings.remove_desc,
        arrow = false,
        icon = 'fa-solid fa-ban',
        iconColor = Config.IconColor,
        disabled = DATA_CLOTHING?.isRemoveDisabled,
        onSelect = function()
            DATA_CLOTHING.isRemoveDisabled = true

            ChangeComponent('set', 'torso')
            ChangeComponent('set', 'mask')
            ChangeComponent('set', 'arms')
            ChangeComponent('set', 'pants')
            ChangeComponent('set', 'bag')
            ChangeComponent('set', 'shoes')
            ChangeComponent('set', 'shirt')
            ChangeComponent('set', 'vest')
            ChangeComponent('set', 'neck')
            ChangeProp('remove', 'hat')
            ChangeProp('remove', 'glass')
            ChangeProp('remove', 'ears')
            ChangeProp('remove', 'watch')
            ChangeProp('remove', 'bracelets')
        end
    }


    MENU[#MENU + 1] = {
        title = Strings.hat_title,
        description = Strings.hat_desc,
        arrow = false,
        icon = 'fa-brands fa-redhat',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.hat?.state then
                ChangeProp('reset', 'hat')
            else
                ChangeProp('remove', 'hat')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.mask_title,
        description = Strings.mask_desc,
        arrow = false,
        icon = 'fa-solid fa-masks-theater',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.mask?.state then
                ChangeComponent('reset', 'mask')
            else
                ChangeComponent('set', 'mask')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.ears_title,
        description = Strings.ears_desc,
        arrow = false,
        icon = 'fa-solid fa-ear-listen',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.ears?.state then
                ChangeProp('reset', 'ears')
            else
                ChangeProp('remove', 'ears')
            end
        end
    }


    MENU[#MENU + 1] = {
        title = Strings.glasses_title,
        description = Strings.glasses_desc,
        arrow = false,
        icon = 'fa-solid fa-glasses',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.glass?.state then
                ChangeProp('reset', 'glass')
            else
                ChangeProp('remove', 'glass')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.shirt_title,
        description = Strings.shirt_desc,
        arrow = false,
        icon = 'fa-solid fa-shirt',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.shirt?.state then
                ChangeComponent('reset', 'shirt')
                if not DATA_CLOTHING?.torso?.state then
                    ChangeComponent('reset', 'arms', true)
                end
            else
                ChangeComponent('set', 'shirt')
                if not DATA_CLOTHING?.torso?.state then
                    ChangeComponent('set', 'arms', true)
                end
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.torso_title,
        description = Strings.torso_desc,
        arrow = false,
        icon = 'fa-solid fa-shirt',
        iconColor = Config.IconColor,
        disabled = GetPedDrawableVariation(cache.ped, 11) == 15 and GetPedTextureVariation(cache.ped, 11) == 0 and not DATA_CLOTHING?.torso?.state,
        onSelect = function()
            if DATA_CLOTHING?.torso?.state then
                ChangeComponent('reset', 'torso')
                if not DATA_CLOTHING?.shirt?.state then
                    ChangeComponent('reset', 'arms', true)
                end
            else
                ChangeComponent('set', 'torso')
                if not DATA_CLOTHING?.shirt?.state then
                    ChangeComponent('set', 'arms', true)
                end
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.neck_title,
        description = Strings.neck_desc,
        arrow = false,
        icon = 'fa-brands fa-black-tie',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.neck?.state then
                ChangeComponent('reset', 'neck')
            else
                ChangeComponent('set', 'neck')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.vest_title,
        description = Strings.vest_desc,
        arrow = false,
        icon = 'fa-solid fa-vest',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.vest?.state then
                ChangeComponent('reset', 'vest')
            else
                ChangeComponent('set', 'vest')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.bag_title,
        description = Strings.bag_desc,
        arrow = false,
        icon = 'fa-solid fa-bag-shopping',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.bag?.state then
                ChangeComponent('reset', 'bag')
            else
                ChangeComponent('set', 'bag')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.pants_title,
        description = Strings.pants_desc,
        arrow = false,
        icon = 'fa-solid fa-xmark',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.pants?.state then
                ChangeComponent('reset', 'pants')
            else
                ChangeComponent('set', 'pants')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.shoes_title,
        description = Strings.shoes_desc,
        arrow = false,
        icon = 'fa-solid fa-shoe-prints',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.shoes?.state then
                ChangeComponent('reset', 'shoes')
            else
                ChangeComponent('set', 'shoes')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.watch_title,
        description = Strings.watch_desc,
        arrow = false,
        icon = 'fa-solid fa-stopwatch',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.watch?.state then
                ChangeProp('reset', 'watch')
            else
                ChangeProp('remove', 'watch')
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.bracelets_title,
        description = Strings.bracelets_desc,
        arrow = false,
        icon = 'fa-solid fa-hand',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_CLOTHING?.bracelets?.state then
                ChangeProp('reset', 'bracelets')
            else
                ChangeProp('remove', 'bracelets')
            end
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:clothing',
        title = Strings.menu_clothing,
        menu = 'zrx_personalmenu:personal_menu:main',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

local DATA_ENGINE = true
OpenVehicleMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    MENU[#MENU + 1] = {
        title = Strings.eng_title,
        description = Strings.eng_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_ENGINE then
                DATA_ENGINE = false

                while not DATA_ENGINE and IsVehicleValid() do
                    SetVehicleEngineOn(cache.vehicle, false, false, false)
                    SetVehicleUndriveable(cache.vehicle, true)
                    Wait(0)
                end
            else
                DATA_ENGINE = true

                SetVehicleEngineOn(cache.vehicle, true, false, false)
                SetVehicleUndriveable(cache.vehicle, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.give_title,
        description = Strings.give_desc,
        arrow = DoesEntityExist(nearPlayerPed) and IsVehicleValid(),
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed) or not IsVehicleValid(),
        onSelect = function()
            local plate = GetVehicleNumberPlateText(cache.vehicle)

            TriggerServerEvent('zrx_personalmenu:server:giveCar', nearPlayerId, plate)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.extra_title,
        description = Strings.extra_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleExtrasMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.livery_title,
        description = Strings.livery_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleLiveryMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.lights_title,
        description = Strings.lights_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleLightsMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.window_title,
        description = Strings.window_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleWindowMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.doors_title,
        description = Strings.doors_desc,
        arrow = true,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            OpenVehicleDoorsMenu()
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:vehicle',
        title = Strings.menu_veh,
        menu = 'zrx_personalmenu:personal_menu:main',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenVehicleExtrasMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    elseif not Config.CanOpenExtras() then
        CORE.Bridge.notification(Strings.extra_cannot)
        return OpenVehicleMenu()
    end

    local MENU = {}

    for i = 0, 20 do
        MENU[#MENU + 1] = {
            title = (Strings.extra_title2):format(i, IsVehicleExtraTurnedOn(cache.vehicle, i) and Strings.on or Strings.off),
            description = Strings.extra_desc2,
            arrow = false,
            icon = 'fa-solid fa-car-side',
            iconColor = Config.IconColor,
            disabled = not DoesExtraExist(cache.vehicle, i),
            args = { id = i },
            onSelect = function(args)
                if IsVehicleExtraTurnedOn(cache.vehicle, args.id) then
                    SetVehicleExtra(cache.vehicle, args.id, 1)
                else
                    SetVehicleExtra(cache.vehicle, args.id, 0)
                end

                OpenVehicleExtrasMenu()
            end
        }
    end

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:vehicle:extras',
        title = Strings.menu_veh_extra,
        menu = 'zrx_personalmenu:personal_menu:vehicle',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenVehicleLiveryMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}
    local livCount = GetVehicleLiveryCount(cache.vehicle)

    if livCount > 0 then
        for i = 0, livCount do
            MENU[#MENU + 1] = {
                title = (Strings.livery_title2):format(i),
                description = Strings.livery_desc2,
                arrow = false,
                icon = 'fa-solid fa-car-side',
                iconColor = Config.IconColor,
                args = { id = i },
                onSelect = function(args)
                    SetVehicleLivery(cache.vehicle, args.id)

                    OpenVehicleLiveryMenu()
                end
            }
        end
    else
        MENU[#MENU + 1] = {
            title = 'No liverys',
            description = 'This vehicle has no liverys',
            arrow = false,
            icon = 'fa-solid fa-xmark',
            iconColor = Config.IconColor,
            readOnly = true,
        }
    end

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:vehicle:livery',
        title = Strings.menu_veh_livery,
        menu = 'zrx_personalmenu:personal_menu:vehicle',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

local DATA_LIGHTS = {
    interior = true,
    exterior = true,
    neon = true
}
OpenVehicleLightsMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title =  Strings.lights_int_title,
        description = Strings.lights_int_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_LIGHTS.interior then
                DATA_LIGHTS.interior = false
                SetVehicleInteriorlight(cache.vehicle, false)
            else
                DATA_LIGHTS.interior = true
                SetVehicleInteriorlight(cache.vehicle, true)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.lights_ext_title,
        description = Strings.lights_ext_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_LIGHTS.exterior then
                DATA_LIGHTS.exterior = false
                SetVehicleLights(cache.vehicle, false)
            else
                DATA_LIGHTS.exterior = true
                SetVehicleLights(cache.vehicle, true)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.lights_neon_title,
        description = Strings.lights_neon_desc,
        arrow = false,
        icon = 'fa-solid fa-car',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_LIGHTS.neon then
                DATA_LIGHTS.neon = false
                DisableVehicleNeonLights(cache.vehicle, false)
            else
                DATA_LIGHTS.neon = true
                DisableVehicleNeonLights(cache.vehicle, true)
            end
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:vehicle:lights',
        title = Strings.menu_veh_lights,
        menu = 'zrx_personalmenu:personal_menu:vehicle',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

local DATA_WINDOWS = {
    front_left = false,
    front_right = false,
    back_left = false,
    back_right = false
}
OpenVehicleWindowMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.all_win_down_title,
        description = Strings.all_win_down_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            for i = 1, #DATA_WINDOWS do
                DATA_WINDOWS[i] = false
            end

            RollDownWindows(cache.vehicle)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.all_win_up_title,
        description = Strings.all_win_up_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            for i = 1, #DATA_WINDOWS do
                DATA_WINDOWS[i] = true
            end

            for i = 0, 3 do
                RollUpWindow(cache.vehicle, i)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.left_front_win_title,
        description = Strings.left_front_win_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_WINDOWS.front_left then
                DATA_LIGHTS.front_left = false
                RollUpWindow(cache.vehicle, 0)
            else
                DATA_LIGHTS.front_left = true
                RollDownWindow(cache.vehicle, 0)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.right_front_win_title,
        description = Strings.right_front_win_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_WINDOWS.front_right then
                DATA_LIGHTS.front_right = false
                RollUpWindow(cache.vehicle, 1)
            else
                DATA_LIGHTS.front_right = true
                RollDownWindow(cache.vehicle, 1)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.left_back_win_title,
        description = Strings.left_back_win_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_WINDOWS.back_left then
                DATA_LIGHTS.back_left = false
                RollUpWindow(cache.vehicle, 2)
            else
                DATA_LIGHTS.back_left = true
                RollDownWindow(cache.vehicle, 2)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.right_back_win_title,
        description = Strings.right_back_win_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_WINDOWS.back_right then
                DATA_LIGHTS.back_right = false
                RollUpWindow(cache.vehicle, 3)
            else
                DATA_LIGHTS.back_right = true
                RollDownWindow(cache.vehicle, 3)
            end
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:vehicle:windows',
        title = Strings.menu_veh_win,
        menu = 'zrx_personalmenu:personal_menu:vehicle',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

local DATA_DOORS = {
    front_left = false,
    front_right = false,
    back_left = false,
    back_right = false,
    hood = false,
    trunk = false
}
OpenVehicleDoorsMenu = function()
    if not IsVehicleValid() then
        return OpenMainMenu()
    end

    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.all_doors_close_title,
        description = Strings.all_doors_close_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            for i = 1, #DATA_DOORS do
                DATA_DOORS[i] = true
            end

            for i = 0, 4 do
                SetVehicleDoorOpen(cache.vehicle, i, false, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.all_doors_open_title,
        description = Strings.all_doors_open_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            for i = 1, #DATA_DOORS do
                DATA_DOORS[i] = false
            end

            SetVehicleDoorsShut(cache.vehicle, false)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.left_front_door_title,
        description = Strings.left_front_door_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_DOORS.front_left then
                DATA_DOORS.front_left = false
                SetVehicleDoorShut(cache.vehicle, 0, false)
            else
                DATA_DOORS.front_left = true
                SetVehicleDoorOpen(cache.vehicle, 0, false, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.right_front_door_title,
        description = Strings.right_front_door_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_DOORS.front_right then
                DATA_DOORS.front_right = false
                SetVehicleDoorShut(cache.vehicle, 1, false)
            else
                DATA_DOORS.front_right = true
                SetVehicleDoorOpen(cache.vehicle, 1, false, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.left_back_door_title,
        description = Strings.left_back_door_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_DOORS.back_left then
                DATA_DOORS.back_left = false
                SetVehicleDoorShut(cache.vehicle, 2, false)
            else
                DATA_DOORS.back_left = true
                SetVehicleDoorOpen(cache.vehicle, 2, false, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.right_back_door_title,
        description = Strings.right_back_door_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_DOORS.back_right then
                DATA_DOORS.back_right = false
                SetVehicleDoorShut(cache.vehicle, 3, false)
            else
                DATA_DOORS.back_right = true
                SetVehicleDoorOpen(cache.vehicle, 3, false, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.hood_title,
        description = Strings.hood_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_DOORS.hood then
                DATA_DOORS.hood = false
                SetVehicleDoorShut(cache.vehicle, 4, false)
            else
                DATA_DOORS.hood = true
                SetVehicleDoorOpen(cache.vehicle, 4, false, false)
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.trunk_title,
        description = Strings.trunk_desc,
        arrow = false,
        icon = 'fa-solid fa-car-side',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_DOORS.trunk then
                DATA_DOORS.trunk = false
                SetVehicleDoorShut(cache.vehicle, 5, false)
            else
                DATA_DOORS.trunk = true
                SetVehicleDoorOpen(cache.vehicle, 5, false, false)
            end
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:vehicle:doors',
        title = Strings.menu_veh_doors,
        menu = 'zrx_personalmenu:personal_menu:vehicle',
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

local DATA_SETTINGS = {
    graphic = false,
    booster = false
}
OpenSettingMenu = function()
    local MENU = {}
    local settingsFile, lines, setting

    MENU[#MENU + 1] = {
        title = Strings.graphic_title,
        description = Strings.graphic_desc,
        arrow = false,
        icon = 'fa-solid fa-brush',
        iconColor = Config.IconColor,
        onSelect = function()
            if DATA_SETTINGS.graphic then
                DATA_SETTINGS.graphic = false
                settingsFile = LoadResourceFile(GetCurrentResourceName(), 'files/graphic_off.dat')
                lines = CORE.Shared.StringSplit(settingsFile, '\n')

                for k, v in ipairs(lines) do
                    if not CORE.Shared.StartsWith(v, '#') and not CORE.Shared.StartsWith(v, '//') and (v ~= '' or v ~= ' ') and #v > 1 then
                        v = v:gsub('%s+', ' ')
                        setting = CORE.Shared.StringSplit(v, ' ')

                        if setting[1] and setting[2] and tonumber(setting[2]) then
                            SetVisualSettingFloat(setting[1], tonumber(setting[2])+.0 )
                        end
                    end
                end
            else
                DATA_SETTINGS.graphic = true
                settingsFile = LoadResourceFile(GetCurrentResourceName(), 'files/graphic_on.dat')
                lines = CORE.Shared.StringSplit(settingsFile, '\n')

                for k, v in ipairs(lines) do
                    if not CORE.Shared.StartsWith(v, '#') and not CORE.Shared.StartsWith(v, '//') and (v ~= '' or v ~= ' ') and #v > 1 then
                        v = v:gsub('%s+', ' ')
                        setting = CORE.Shared.StringSplit(v, ' ')

                        if setting[1] and setting[2] and tonumber(setting[2]) then
                            SetVisualSettingFloat(setting[1], tonumber(setting[2])+.0 )
                        end
                    end
                end
            end
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.booster_title,
        description = Strings.booster_desc,
        arrow = false,
        icon = 'fa-solid fa-rocket',
        iconColor = Config.IconColor,
        onSelect = function()
            OnBooster(not DATA_SETTINGS.booster)
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:setting',
        title = Strings.menu_setting,
        menu = 'zrx_personalmenu:personal_menu:main'
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenBillMenu = function()
    local MENU = {}
    local PLAYER_BILLS = lib.callback.await('zrx_personalmenu:server:getPlayerBills', 500)
    local money = 0

    if COOLDOWN then
        CORE.Bridge.notification(Strings.on_cooldown)
        return OpenMainMenu()
    end
    StartCooldown()

    for k, data in pairs(PLAYER_BILLS) do
        money += data.amount
    end

    if #PLAYER_BILLS > 0 then
        MENU[#MENU + 1] = {
            title = 'Informations',
            description = 'Hover to see',
            arrow = false,
            icon = 'fa-solid fa-circle-info',
            iconColor = Config.IconColor,
            readOnly = true,
            metadata = {
                {
                    label = 'Total Bills',
                    value = ('#%s'):format(#PLAYER_BILLS)
                },
                {
                    label = 'Total Amount',
                    value = ('$%s'):format(money)
                },
            }
        }

        for k, data in pairs(PLAYER_BILLS) do
            MENU[#MENU + 1] = {
                title = (Strings.bill_title):format(k --[[data.id DATABASE ID]]),
                description = Strings.bill_desc,
                arrow = false,
                icon = 'fa-solid fa-money-bill',
                iconColor = Config.IconColor,
                args = {
                    id = data.id,
                    label = data.label,
                    amount = data.amount
                },
                onSelect = function()
                    COOLDOWN = false
                    Config.PayBill(data.id)
                    Wait(100)
                    OpenBillMenu()
                end,
                metadata = {
                    {
                        label = Strings.bill_reason,
                        value = data.label
                    },
                    {
                        label = Strings.bill_amount,
                        value = (Strings.bill_amount_value):format(data.amount)
                    },
                }
            }
        end
    else
        MENU[#MENU + 1] = {
            title = Strings.bill_no,
            description = Strings.bill_no_desc,
            arrow = false,
            icon = 'fa-solid fa-xmark',
            iconColor = Config.IconColor,
            readOnly = true,
        }
    end

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:bills',
        title = Strings.menu_bills,
        menu = 'zrx_personalmenu:personal_menu:main'
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenCompanyMenu = function()
    local MENU = {}
    local DATA_SOCIETY = lib.callback.await('zrx_personalmenu:server:getSocietyData', 500, CORE.Bridge.getVariables().job.name)
    local nearPlayer = lib.getClosestPlayer(GetEntityCoords(cache.ped), 3.0, false)
    local nearPlayerId = GetPlayerServerId(nearPlayer)
    local nearPlayerPed = GetPlayerPed(nearPlayer)

    if COOLDOWN then
        CORE.Bridge.notification(Strings.on_cooldown)
        return OpenMainMenu()
    elseif not IsGradeAllowed() then
        return OpenMainMenu()
    end
    StartCooldown()

    MENU[#MENU + 1] = {
        title = Strings.company_money_title,
        description = (Strings.company_money_desc):format(lib.math.groupdigits(DATA_SOCIETY.money, '.')),
        arrow = false,
        icon = 'fa-solid fa-credit-card',
        iconColor = Config.IconColor,
        readOnly = true,
    }

    MENU[#MENU + 1] = {
        title = Strings.company_hire_title,
        description = Strings.company_hire_desc,
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'hire')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_fire_title,
        description = Strings.company_fire_desc,
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'fire')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_promote_title,
        description = Strings.company_promote_desc,
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'promote')
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.company_derank_title,
        description = Strings.company_derank_desc,
        arrow = false,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = not DoesEntityExist(nearPlayerPed),
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:managePlayer', nearPlayerId, 'derank')
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:company',
        title = Strings.menu_company,
        menu = 'zrx_personalmenu:personal_menu:main'
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenEditorMenu = function()
    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.editor_record,
        description = Strings.editor_record_desc,
        arrow = false,
        icon = 'fa-solid fa-video',
        iconColor = Config.IconColor,
        onSelect = function()
            StartRecording(1)
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.editor_save,
        description = Strings.editor_save_desc,
        arrow = false,
        icon = 'fa-solid fa-floppy-disk',
        iconColor = Config.IconColor,
        onSelect = function()
            StartRecording(0)
            StopRecordingAndSaveClip()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.editor_delete,
        description = Strings.editor_delete_desc,
        arrow = false,
        icon = 'fa-solid fa-trash',
        iconColor = Config.IconColor,
        onSelect = function()
            StopRecordingAndDiscardClip()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.editor_open,
        description = Strings.editor_open_desc,
        arrow = false,
        icon = 'fa-solid fa-arrow-up-right-from-square',
        iconColor = Config.IconColor,
        onSelect = function()
            NetworkSessionLeaveSinglePlayer()
            ActivateRockstarEditor()
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:editor',
        title = Strings.menu_editor,
        menu = 'zrx_personalmenu:personal_menu:main'
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenNavigationMenu = function()
    local MENU = {}

    MENU[#MENU + 1] = {
        title = Strings.navi_clear,
        description = Strings.navi_clear_desc,
        arrow = false,
        icon = 'fa-solid fa-xmark',
        iconColor = Config.IconColor,
        disabled = #DATA_BLIP < 1,
        onSelect = function()
            for k, data in pairs(DATA_BLIP) do
                RemoveDestionation(k)
            end

            CORE.Bridge.notification(Strings.navi_clear_notify)
        end,
    }

    MENU[#MENU + 1] = {
        title = Strings.navi_preset,
        description = Strings.navi_preset_desc,
        arrow = true,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = #Config.Navigation.destinations < 1,
        onSelect = function()
            OpenNavigationPresetMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.navi_my,
        description = Strings.navi_my_desc,
        arrow = true,
        icon = 'fa-solid fa-person',
        iconColor = Config.IconColor,
        disabled = #Config.Navigation.destinations < 1,
        onSelect = function()
            OpenNavigationMyMenu()
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:navigation',
        title = Strings.menu_navi,
        menu = 'zrx_personalmenu:personal_menu:main'
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenNavigationMyMenu = function()
    local MENU = {}
    local PLAYER_NAVI = lib.callback.await('zrx_personalmenu:server:getPlayerNavigation', 500)
    local pedCoords = GetEntityCoords(cache.ped)
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(pedCoords.x, pedCoords.y, pedCoords.z))

    MENU[#MENU + 1] = {
        title = Strings.navi_create,
        description = Strings.navi_create_desc,
        arrow = true,
        icon = 'fa-solid fa-plus',
        iconColor = Config.IconColor,
        onSelect = function()
            local input = lib.inputDialog(Strings.navi_create_title, {
                {
                    type = 'input',
                    label = Strings.navi_create_name,
                    description = Strings.navi_create_name_desc,
                    required = true,
                    min = 1,
                    max = 64
                },
                {
                    type = 'input',
                    label = Strings.navi_create_coords,
                    description = Strings.navi_create_coords_desc,
                    required = false,
                    disabled = true,
                    default = (Strings.navi_create_coords_default):format(CORE.Shared.RoundNumber(pedCoords.x, 1), CORE.Shared.RoundNumber(pedCoords.y, 1), CORE.Shared.RoundNumber(pedCoords.z, 1))
                },
                {
                    type = 'input',
                    label = Strings.navi_create_street,
                    description = Strings.navi_create_street,
                    required = false,
                    disabled = true,
                    default = (Strings.navi_create_street_default):format(street)
                },
            })

            if not input then
                CORE.Bridge.notification(Strings.not_fill)
                return OpenNavigationMyMenu()
            end

            TriggerServerEvent('zrx_personalmenu:server:manageNavigation', 'create', {
                name = input[1],
                coords = pedCoords,
                street = street,
                image = RequestScreenshot()
            }
)
        end
    }

    if #PLAYER_NAVI > 0 then
        for i, data in ipairs(PLAYER_NAVI) do
            MENU[#MENU + 1] = {
                title = data.name,
                description = Strings.navi_manage,
                arrow = true,
                icon = 'fa-solid fa-location-dot',
                iconColor = Config.IconColor,
                image = data.image,
                metadata = {
                    {
                        label = Strings.navi_street,
                        value = (Strings.navi_street_desc):format(data.street)
                    }
                },
                args = {
                    name = data.name,
                    coords = data.coords,
                    street = data.street,
                    image = data.image,
                    id = data.id,
                },
                onSelect = function(args)
                    OpenNavigationSettingMenu(args)
                end,
            }
        end
    else
        MENU[#MENU + 1] = {
            title = Strings.navi_no,
            description = Strings.navi_no_desc,
            arrow = false,
            icon = 'fa-solid fa-xmark',
            iconColor = Config.IconColor,
            readOnly = true,
        }
    end

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:navigation:my',
        title = Strings.menu_navi_my,
        menu = 'zrx_personalmenu:personal_menu:navigation'
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenNavigationSettingMenu = function(data)
    local MENU = {}
    local pedCoords = GetEntityCoords(cache.ped)
    local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(pedCoords.x, pedCoords.y, pedCoords.z))

    MENU[#MENU + 1] = {
        title = Strings.navi_setting,
        description = Strings.navi_setting_desc,
        arrow = false,
        icon = 'fa-solid fa-circle-info',
        iconColor = Config.IconColor,
        image = data.image,
        readOnly = true,
        metadata = {
            {
                label = Strings.navi_setting_name,
                value = (Strings.navi_setting_name_desc):format(data.name)
            },
            {
                label = Strings.navi_setting_coords,
                value = (Strings.navi_setting_coords_desc):format(CORE.Shared.RoundNumber(data.coords.x, 1), CORE.Shared.RoundNumber(data.coords.y, 1), CORE.Shared.RoundNumber(data.coords.z, 1))
            },
            {
                label = Strings.navi_setting_street,
                value = (Strings.navi_setting_street_desc):format(data.street)
            }
        },
        onSelect = function()
            OpenNavigationMyMenu()
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.navi_set,
        description = Strings.navi_set_desc,
        arrow = true,
        icon = 'fa-solid fa-location-dot',
        iconColor = Config.IconColor,
        onSelect = function()
            local blip = Config.Navigation.route(vector3(data.coords.x, data.coords.y, data.coords.z), (Strings.navi_dest):format(data.name))

            DATA_BLIP[#DATA_BLIP + 1] = {
                blip = blip,
                coords = data.coords,
                time = Config.Navigation.timeout
            }

            RenderRoute(data.coords)
            CORE.Bridge.notification((Strings.navi_set2):format(data.name))
        end,
    }

    MENU[#MENU + 1] = {
        title = Strings.navi_edit,
        description = Strings.navi_edit_desc,
        arrow = true,
        icon = 'fa-solid fa-pen-to-square',
        iconColor = Config.IconColor,
        onSelect = function()
            local input = lib.inputDialog(Strings.navi_edit_title, {
                {
                    type = 'input',
                    label = Strings.navi_edit_name,
                    description = Strings.navi_edit_name_desc,
                    required = true,
                    min = 1,
                    max = 64
                },
                {
                    type = 'input',
                    label = Strings.navi_edit_coords,
                    description = Strings.navi_edit_coords_desc,
                    required = false,
                    disabled = true,
                    default = (Strings.navi_edit_coords_default):format(CORE.Shared.RoundNumber(pedCoords.x, 1), CORE.Shared.RoundNumber(pedCoords.y, 1), CORE.Shared.RoundNumber(pedCoords.z, 1))
                },
                {
                    type = 'input',
                    label = Strings.navi_edit_street,
                    description = Strings.navi_edit_street_desc,
                    required = false,
                    disabled = true,
                    default = (Strings.navi_edit_street_default):format(street)
                },
            })

            if not input then
                CORE.Bridge.notification(Strings.not_fill)
                return OpenNavigationMyMenu()
            end

            TriggerServerEvent('zrx_personalmenu:server:manageNavigation', 'edit', {
                name = input[1],
                coords = pedCoords,
                street = street,
                image = RequestScreenshot()
            }, {
                id = data.id,
                name = data.name,
                coords = data.coords,
                street = data.street,
                image = data.image,
            })
        end
    }

    MENU[#MENU + 1] = {
        title = Strings.navi_delete,
        description = Strings.navi_delete_desc,
        arrow = true,
        icon = 'fa-solid fa-xmark',
        iconColor = Config.IconColor,
        onSelect = function()
            TriggerServerEvent('zrx_personalmenu:server:manageNavigation', 'delete', {}, {
                id = data.id,
                name = data.name,
                coords = data.coords,
                street = data.street,
                image = data.image,
            })
        end
    }

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:navigation:setting',
        title = Strings.menu_navi_setting,
        menu = 'zrx_personalmenu:personal_menu:navigation:my'
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

OpenNavigationPresetMenu = function()
    local MENU = {}

    for k, data in pairs(Config.Navigation.destinations) do
        local disable = false

        for v, data2 in pairs(DATA_BLIP) do
            if data.coords == data2.coords then
                disable = true
            end
        end

        MENU[#MENU + 1] = {
            title = data.name,
            description = Strings.navi_desc2,
            arrow = false,
            icon = data.icon or 'fa-solid fa-location-dot',
            iconColor = Config.IconColor,
            image = data.image,
            disabled = disable,
            metadata = {
                {
                    label = Strings.navi_street,
                    value = (Strings.navi_street_desc):format(GetStreetNameFromHashKey(GetStreetNameAtCoord(data.coords.x, data.coords.y, data.coords.z)))
                }
            },
            args = {
                name = data.name
            },
            onSelect = function(args)
                local blip = Config.Navigation.route(vector3(data.coords.x, data.coords.y, data.coords.z), (Strings.navi_dest):format(args.name))

                DATA_BLIP[#DATA_BLIP + 1] = {
                    blip = blip,
                    coords = data.coords,
                    time = Config.Navigation.timeout
                }

                RenderRoute(data.coords)
                CORE.Bridge.notification((Strings.navi_set2):format(data.name))
            end,
        }
    end

    CORE.Client.CreateMenu({
        id = 'zrx_personalmenu:personal_menu:navigation:preset',
        title = Strings.menu_navi_preset,
        menu = 'zrx_personalmenu:personal_menu:navigation'
    }, MENU, Config.Menu.type ~= 'menu', Config.Menu.postition)
end

RenderRoute = function(coords)
    if not DATA_ROUTE.start then
        local pedCoords = GetEntityCoords(cache.ped)

        DATA_ROUTE.start = vector3(pedCoords.x, pedCoords.y, pedCoords.z)
    end

    if coords then
        DATA_ROUTE.coords[#DATA_ROUTE.coords + 1] = vector3(coords.x, coords.y, coords.z)
        DATA_ROUTE.last = vector3(coords.x, coords.y, coords.z)
    end

    ClearGpsMultiRoute()
    SetGpsMultiRouteRender(false)
    StartGpsMultiRoute(26, false, true)

    AddPointToGpsMultiRoute(DATA_ROUTE.start.x, DATA_ROUTE.start.y, DATA_ROUTE.start.z)
    for i, data in ipairs(DATA_ROUTE.coords) do
        AddPointToGpsMultiRoute(data.x, data.y, data.z)
    end

    SetGpsMultiRouteRender(true)
end

RemoveDestionation = function(index)
    if DATA_ROUTE.last == DATA_BLIP[index].coords then
        if #DATA_ROUTE.coords > 1 then
            DATA_ROUTE.last = DATA_ROUTE.coords[2]
        else
            DATA_ROUTE.coords = {}
            DATA_ROUTE.last = nil
            ClearGpsMultiRoute()
        end
    end

    DATA_ROUTE.start = nil
    for i, data in pairs(DATA_ROUTE.coords) do
        if DATA_BLIP[index].coords == data then
            DATA_ROUTE.coords[i] = nil
            DATA_ROUTE.coords = CORE.Shared.SortTableKeys(DATA_ROUTE.coords)
            RenderRoute()
        end
    end

    SetBlipRoute(DATA_BLIP[index].blip, false)
    RemoveBlip(DATA_BLIP[index].blip)
    DATA_BLIP[index] = nil
end

OnBooster = function(state)
    DATA_SETTINGS.booster = state

    if not state then
        RopeDrawShadowEnabled(true)
        CascadeShadowsSetAircraftMode(true)
        CascadeShadowsEnableEntityTracker(false)
        CascadeShadowsSetDynamicDepthMode(true)
        CascadeShadowsSetEntityTrackerScale(5.0)
        CascadeShadowsSetDynamicDepthValue(5.0)
        CascadeShadowsSetCascadeBoundsScale(5.0)
        SetFlashLightFadeDistance(10.0)
        SetLightsCutoffDistanceTweak(10.0)
        SetArtificialLightsState(false)
    else
        RopeDrawShadowEnabled(false)
        CascadeShadowsClearShadowSampleType()
        CascadeShadowsSetAircraftMode(false)
        CascadeShadowsEnableEntityTracker(true)
        CascadeShadowsSetDynamicDepthMode(false)
        CascadeShadowsSetEntityTrackerScale(0.0)
        CascadeShadowsSetDynamicDepthValue(0.0)
        CascadeShadowsSetCascadeBoundsScale(0.0)
        SetFlashLightFadeDistance(0.0)
        SetLightsCutoffDistanceTweak(0.0)
    end

    local pedCoords
    CreateThread(function()
        while DATA_SETTINGS.booster do
            pedCoords = GetEntityCoords(cache.ped)
            DisableOcclusionThisFrame()
            SetDisableDecalRenderingThisFrame()
            RemoveParticleFxInRange(pedCoords.x, pedCoords.y, pedCoords.z, 10.0)
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
            Wait(0)
        end
    end)
end

StartCooldown = function()
    if not Config.Cooldown then return end
    COOLDOWN = true

    CreateThread(function()
        SetTimeout(Config.Cooldown * 1000, function()
            COOLDOWN = false
        end)
    end)
end

IsGradeAllowed = function()
    return not not Config.Company.allowedGrades[CORE.Bridge.getVariables().job.grade_name]
end

IsVehicleValid = function()
    return not not (DoesEntityExist(cache.vehicle) and GetPedInVehicleSeat(cache.vehicle, -1) == cache.ped)
end

PlayAnimation = function(dict, anim, duration)
    lib.requestAnimDict(dict, 500)
    TaskPlayAnim(cache.ped, dict, anim, 8.0, 1.0, -1, 49, 0, false, false, false)
    Wait(duration)
    ClearPedTasks(cache.ped)
end

ChangeComponent = function(action, type, skipAnim)
    if action == 'set' then
        DATA_CLOTHING[type] = {
            name = type,
            drawable = GetPedDrawableVariation(cache.ped, CLOTHE_DATA.ComponentId[type]),
            texture = GetPedTextureVariation(cache.ped, CLOTHE_DATA.ComponentId[type]),
            state = true
        }

        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type].duration)
        end

        SetPedComponentVariation(
            cache.ped,
            CLOTHE_DATA.ComponentId[type],
            IsPedMale(cache.ped) and CLOTHE_DATA.ClotheId[type].male[1] or CLOTHE_DATA.ClotheId[type].female[2],
            IsPedMale(cache.ped) and CLOTHE_DATA.ClotheId[type].male[1] or CLOTHE_DATA.ClotheId[type].female[2],
            2
        )

        if type == 'vest' then
            exports?.zrx_armour:displayArmour(false)
        end
    elseif action == 'reset' then
        if not DATA_CLOTHING[type]?.drawable or not DATA_CLOTHING[type]?.texture then return end
        if DATA_CLOTHING[type]?.drawable == -1 or DATA_CLOTHING[type]?.texture == -1 then return end
        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type].duration)
        end

        SetPedComponentVariation(
            cache.ped,
            CLOTHE_DATA.ComponentId[type],
            DATA_CLOTHING[type].drawable,
            DATA_CLOTHING[type].texture,
            2
        )

        DATA_CLOTHING[type] = {
            name = type,
            drawable = -1,
            texture = -1,
            state = false
        }

        if type == 'vest' then
            exports?.zrx_armour:displayArmour(true)
        end
    end
end

ChangeProp = function(action, type, drawable, texture, skipAnim)
    if action == 'set' then
        DATA_CLOTHING[type] = {
            name = type,
            drawable = GetPedPropIndex(cache.ped, CLOTHE_DATA.PropId[type]),
            texture = GetPedPropTextureIndex(cache.ped, CLOTHE_DATA.PropId[type]),
            state = true
        }

        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type]?.on?.dict or CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type]?.on?.anim or CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type]?.on?.duration or CLOTHE_DATA.Set[type].duration)
        end

        SetPedPropIndex(cache.ped, CLOTHE_DATA.PropId[type], drawable, texture, true)
    elseif action == 'remove' then
        DATA_CLOTHING[type] = {
            name = type,
            drawable = GetPedPropIndex(cache.ped, CLOTHE_DATA.PropId[type]),
            texture = GetPedPropTextureIndex(cache.ped, CLOTHE_DATA.PropId[type]),
            state = true
        }

        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type]?.off?.dict or CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type]?.off?.anim or CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type]?.off?.duration or CLOTHE_DATA.Set[type].duration)
        end

        ClearPedProp(cache.ped, CLOTHE_DATA.PropId[type])
    elseif action == 'reset' then
        if not DATA_CLOTHING[type]?.drawable or not DATA_CLOTHING[type]?.texture then return end
        if DATA_CLOTHING[type]?.drawable == -1 or DATA_CLOTHING[type]?.texture == -1 then return end
        if not skipAnim then
            PlayAnimation(CLOTHE_DATA.Set[type]?.on?.dict or CLOTHE_DATA.Set[type].dict, CLOTHE_DATA.Set[type]?.on?.anim or CLOTHE_DATA.Set[type].anim, CLOTHE_DATA.Set[type]?.on?.duration or CLOTHE_DATA.Set[type].duration)
        end

        SetPedPropIndex(cache.ped, CLOTHE_DATA.PropId[type], DATA_CLOTHING[type].drawable, DATA_CLOTHING[type].texture, true)

        DATA_CLOTHING[type] = {
            name = type,
            drawable = -1,
            texture = -1,
            state = false
        }
    end
end

RequestScreenshot = function()
    if not Config.UseScreenshot then
        return ''
    elseif GetResourceState('screenshot-basic') == 'missing' then
        return ''
    end

    local img = lib.callback.await('zrx_personalmenu:server:getImageWebhook', 500)

    if img:len() <= 0 then
        return ''
    end

    local p = promise.new()

    exports['screenshot-basic']:requestScreenshotUpload(img, 'files[]', function(data)
        p:resolve(json.decode(data).attachments[1].url)
    end)

    return Citizen.Await(p)
end