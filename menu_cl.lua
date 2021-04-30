local isOpen

-- NUI Callbacks/Events
RegisterNUICallback("close", function(data)
    if isOpen then
        isOpen = false
        SendNUIMessage({ action = 'hide' })
        SetNuiFocus(false, false)
    end
end)

RegisterNUICallback('tpOptions', function(data)
    TriggerEvent('PE:teleport', data.action)
end)

RegisterNetEvent('PE:teleport')
AddEventHandler('PE:teleport', function(action)
    local ped
    if IsPedInAnyVehicle(PlayerPedId(), false) then
        ped = GetVehiclePedIsIn(PlayerPedId(), false)
    else 
        ped = PlayerPedId()
    end
    for k, v in ipairs(loc) do
        if action == v.action then
            SetEntityCoords(ped, v.coords.x, v.coords.y, v.coords.z, false, false, false, true)
        end
    end
end)

-- Commands
RegisterCommand('tpmenu', function()
    if not isOpen then
        isOpen = true
        SendNUIMessage({ action = 'show' })
        SetNuiFocus(true, true)
    else
        isOpen = false
        SendNUIMessage({ action = 'hide' })
        SetNuiFocus(false, false)
    end
end)

RegisterKeyMapping('tpmenu', 'Open the teleport menu', 'keyboard', 'f5')

-- Threads 
Citizen.CreateThread(function()
    while isOpen do
        Citizen.Wait(100)
        DisableControlAction(0, 322, true)
    end
end)