RegisterCommand('+togglesiren', function()

    local playerId = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerId)

    if GetPedInVehicleSeat(playerVehicle, -1) ~= playerId and GetPedInVehicleSeat(playerVehicle, 0) ~= playerId then
        print("Not in Driver Seat")
        return
    end

    print(IsVehicleSirenOn(playerVehicle));
    if IsVehicleSirenOn(playerVehicle) then
        print("Siren is on. Turning it off...")
        SetVehicleSiren(playerVehicle, false)
    else
        print("Siren is off. Turning it on...")
        SetVehicleSiren(playerVehicle, true)
    end
end)

RegisterKeyMapping('+togglesiren', 'Toggles the siren on/off', 'keyboard', 'O')

