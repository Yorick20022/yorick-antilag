RegisterNetEvent("flames")

AddEventHandler("flames", function(entity)
    if type(entity) ~= "number" then return end
    TriggerClientEvent("client_flames", -1, entity)
end)

RegisterNetEvent('sound_server:PlayWithinDistance')
AddEventHandler('sound_server:PlayWithinDistance', function(disMax, audioFile, audioVol)
    TriggerClientEvent('sound_client:PlayWithinDistance', -1, GetEntityCoords(GetPlayerPed(source)), disMax, audioFile,
        audioVol)
end)
