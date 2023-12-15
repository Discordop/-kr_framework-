
RegisterCommand('seat', function(_, args)
    local seatNumber = tonumber(args[1]) - 2
    local playerId = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerId)
    if not playerVehicle then
        return
    end
    if not seatNumber or type(seatNumber) ~= 'number' then
        return
    end
    if IsVehicleSeatFree(playerVehicle, seatNumber) then
        SetPedIntoVehicle(playerId, playerVehicle, seatNumber)
    else
        return
    end
end)

RegisterCommand('+openhood', function()
    local playerId = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerId)

    if playerVehicle <=0 then 
        return
    end

    if GetPedInVehicleSeat(playerVehicle, -1) ~= playerId then
        return
    end

    if GetVehicleDoorAngleRatio(playerVehicle, 4) > 0.1 then
        SetVehicleDoorShut(playerVehicle, 4, false)
    else 
        SetVehicleDoorOpen(playerVehicle, 4, false, false)
    end
 end)


RegisterCommand('+opentrunk', function()
    local playerId = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerId)

    if playerVehicle <=0 then 
        return
    end

    if GetPedInVehicleSeat(playerVehicle, -1) ~= playerId then
        return
    end

    if GetVehicleDoorAngleRatio(playerVehicle, 5) > 0.1 then
        SetVehicleDoorShut(playerVehicle, 5, false)
    else 
        SetVehicleDoorOpen(playerVehicle, 5, false, false)
    end
end)

RegisterKeyMapping('+openhood', 'Opens Vehicle Hood', 'keyboard', 'PAGEUP')
RegisterKeyMapping('+opentrunk', 'Opens Vehicle Trunk', 'keyboard', 'PAGEDOWN')

-- CreateThread(function()
--     while true do
--         Wait(0)

--         local playerId = PlayerPedId()
--         local playerVehicle = GetVehiclePedIsIn(playerId, false)

--         if playerVehicle > 0 and GetPedInVehicleSeat(playerVehicle, -1) == playerId then
--             if IsControlJustReleased(0, 208) then
--                 if GetVehicleDoorAngleRatio(playerVehicle, 4) > 0.1 then
--                     SetVehicleDoorShut(playerVehicle, 4, false)
--                 else
--                     SetVehicleDoorOpen(playerVehicle, 4, false, false)
--                 end
--             end

--             if IsControlJustReleased(0, 207) then
--                 if GetVehicleDoorAngleRatio(playerVehicle, 5) > 0.1 then
--                     SetVehicleDoorShut(playerVehicle, 5, false)
--                 else
--                     SetVehicleDoorOpen(playerVehicle, 5, false, false)
--                 end
--             end
--         end
--     end
-- end)
