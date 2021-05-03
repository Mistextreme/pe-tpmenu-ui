RegisterNetEvent('PE:teleport'), function(action)
    local ped
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        ped = GetVehiclePedIsIn(PlayerPedId(), false)
    else 
        ped = PlayerPedId()
    end
    for i = 1, #Config.Locations do
        local location = Config.Locations[i]
        if action == location.action then
            SetEntityCoords(ped, location.coords, false, false, false, true)
            SetEntityHeading(ped, location.heading)
        end
    end
end)