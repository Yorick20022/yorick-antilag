local isAntiLagEnabled = true

RegisterCommand("antilag", function()
    isAntiLagEnabled = not isAntiLagEnabled
    PlaySoundFrontend(-1, 'CONFIRM_BEEP', 'HUD_MINI_GAME_SOUNDSET', true)
    message("~" .. (isAntiLagEnabled and "g" or "r") .. "~Antilag is now " .. (isAntiLagEnabled and "enabled" or "disabled") .. " for you~")
end, false)

RegisterNetEvent("client_flames")

CreateThread(function()
    while isAntiLagEnabled do
        Wait(0)
        local player = PlayerPedId()
        local veh = GetVehiclePedIsIn(player, false)
        local vehiclePos = GetEntityCoords(veh)
        local delay = (math.random(25, Config.explosionSpeed))
        if GetPedInVehicleSeat(GetVehiclePedIsIn(PlayerPedId()), -1) == player then
            local RPM = GetVehicleCurrentRpm(veh, player)
            local gear = GetVehicleCurrentGear(veh)
            local reverse = 0

            for _, cars in pairs(Config.Cars) do
                local vehicleModel = GetEntityModel(veh, player)
                if GetHashKey(cars) == vehicleModel then
                    if gear ~= reverse then
                        if not IsControlPressed(1, 71) and not IsControlPressed(1, 72) then
                            if RPM > Config.RPM then
                                TriggerServerEvent("flames", VehToNet(veh))
                                AddExplosion(vehiclePos, 61, 0.0, true, true, 0.0, true)
                                Wait(delay)
                            end
                        end
                    end
                end
            end
        end
    end
end)

local exhausts = { "exhaust", "exhaust_2", "exhaust_3", "exhaust_4" }
local fxName = "veh_backfire"
local fxGroup = "core"

AddEventHandler("client_flames", function(c_veh)
    for _, bones in pairs(exhausts) do
        local boneIndex = GetEntityBoneIndexByName(NetToVeh(c_veh), bones)
        if boneIndex ~= -1 then
            UseParticleFxAssetNextCall(fxGroup)
            local createdPart = StartParticleFxLoopedOnEntityBone(fxName, NetToVeh(c_veh), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0,
                GetEntityBoneIndexByName(NetToVeh(c_veh), bones), Config.flameSize, 0.0, 0.0, 0.0)
            StopParticleFxLooped(createdPart, true)
        end
    end
end)

function message(text)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(text)
    DrawNotification(false, false)
end

