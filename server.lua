RegisterNetEvent("flames")

AddEventHandler("flames", function(entity)
    TriggerClientEvent("client_flames", -1, entity)
end)
