RegisterNetEvent('PE:teleport'), function(action)
    local source = source
    local ped
    if IsPedInAnyVehicle(GetPlayerPed(source), false) then
        ped = GetVehiclePedIsIn(GetPlayerPed(source), false)
    else 
        ped = GetPlayerPed(source)
    end
    for i = 1, #Config.Locations do
        local location = Config.Locations[i]
        if action == location.action then
            SetEntityCoords(ped, location.coords, false, false, false, true)
            SetEntityHeading(ped, location.heading)
        end
    end
end)