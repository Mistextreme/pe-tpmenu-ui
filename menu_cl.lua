local isOpen = false

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
    if action == "tpone" then
        SetEntityCoords(ped, -45.3, -1113.6, 26.43, false, false, false, true)
    elseif action == "tptwo" then
        SetEntityCoords(ped, -45.3, -1013.6, 26.43, false, false, false, true)
    elseif action == "tpthree" then
        SetEntityCoords(ped, -45.3, -1013.6, 26.43, false, false, false, true)
    --elseif action == "tpfour" then -- For creating more, you copy this line. Change the tpfour to the next number(or whatever you want)
        --SetEntityCoords(ped, -45.3, -1013.6, 26.43, false, false, false, true) -- Then copy this line and change the coords to your location
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