local isOpen = false

-- NUI Callbacks/Events
RegisterNUICallback("close", function(data)
    if isOpen then
        isOpen = false
        SendNUIMessage({ action = 'hide' })
        SetNuiFocus(false, false)
    end
end)

RegisterNUICallback('tpo', function(data)
    TriggerEvent('HT:teleport', data.action)
end)

RegisterNetEvent('HT:teleport')
AddEventHandler('HT:teleport', function(action)
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
    end
end)

-- Commands
RegisterCommand('tpmenu', function()
    if not IsEntityDead(PlayerPedId()) then
        if not isOpen then
            isOpen = true
            SendNUIMessage({ action = 'show' })
            SetNuiFocus(true, true)
        else
            isOpen = false
            SendNUIMessage({ action = 'hide' })
            SetNuiFocus(false, false)
        end
    else
        print("You are dead")
    end
end)

-- Threads 
Citizen.CreateThread(function()
    while isOpen do
        Citizen.Wait(100)
        DisableControlAction(0, 322, true)
    end
end)