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
        if action == "tp1" then
            SetEntityCoords(ped, v.num1.x, v.num1.y, v.num1.z, false, false, false, true)
        elseif action == "tp2" then
            SetEntityCoords(ped, v.num2.x, v.num2.y, v.num2.z, false, false, false, true)
        elseif action == "tp3" then
            SetEntityCoords(ped, v.num3.x, v.num3.y, v.num3.z, false, false, false, true)
        elseif action == "tp4" then
            SetEntityCoords(ped, v.num4.x, v.num4.y, v.num4.z, false, false, false, true)
        elseif action == "tp5" then
            SetEntityCoords(ped, v.num5.x, v.num5.y, v.num5.z, false, false, false, true)
        elseif action == "tp6" then
            SetEntityCoords(ped, v.num6.x, v.num6.y, v.num6.z, false, false, false, true)
        elseif action == "tp7" then
            SetEntityCoords(ped, v.num7.x, v.num7.y, v.num7.z, false, false, false, true)
        elseif action == "tp8" then
            SetEntityCoords(ped, v.num8.x, v.num8.y, v.num8.z, false, false, false, true)
        elseif action == "tp9" then
            SetEntityCoords(ped, v.num9.x, v.num9.y, v.num9.z, false, false, false, true)
        elseif action == "tp10" then
            SetEntityCoords(ped, v.num10.x, v.num10.y, v.num10.z, false, false, false, true)
        --elseif action == "tpeleven" then -- For creating more, you copy this line. Change the tpfour to the next number(or whatever you want)
            --SetEntityCoords(ped, v.num11.x, v.num11.y, v.num11.z, false, false, false, true) -- Then copy this line and change the coords to your location
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