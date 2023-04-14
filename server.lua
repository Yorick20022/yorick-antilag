RegisterNetEvent("flames")

AddEventHandler("flames", function(entity)
    if type(entity) ~= "number" then return end
    TriggerClientEvent("client_flames", -1, entity)
end)
