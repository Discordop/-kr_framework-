-- emergency_vehicles = {
--     "OPP1", "OPP2", "OPP3", "OPP4", "OPP5", "OPP6", "OPP7", "OPP8", "OPP9", "OPP10"
-- }

-- local vehicleNeedHotwire = true;
-- CreateThread(function()
--     local playerId = PlayerPedId()
--     while true do
--         Wait(200)
--         local vehicle = GetVehiclePedIsTryingToEnter(playerId) or GetVehiclePedIsIn(playerId)
--         if IsPedGettingIntoAVehicle(playerId) then
--             if GetIsVehicleEngineRunning(vehicle) then
--                 SetVehicleDoorsLocked(vehicle, 2)
--                 SetVehicleNeedsToBeHotwired(vehicle, true)
--             end
--         else
--             if IsVehicleNeedsToBeHotwired(vehicle) then
--                 SetVehicleNeedsToBeHotwired(vehicle, true)
--                 exports['progressBars']:startUI(25000, "Hotwiring Vehicle")
--                 Wait(25000)
--                 SetVehicleEngineOn(vehicle, true, true, false)
--             end
--         end
--     end
-- end
-- )

CreateThread(function()
    local playerId = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerId, false)
    local vehicleHash = GetEntityModel(playerVehicle)
    while true do
        Wait(0)

        -- DISABLE COPS
        SetDispatchCopsForPlayer(PlayerId(), false)
        SetPoliceIgnorePlayer(PlayerId(), true)
        if GetPlayerWantedLevel(PlayerId()) >= 1 then
            ClearPlayerWantedLevel(PlayerId())
        end
        --

        if containsItem(emergency_vehicles, GetDisplayNameFromVehicleModel(vehicleHash)) and GetPedInVehicleSeat(playerVehicle, -1) == playerId then
            DisableControlAction(0, 85, true)
        end
    end
end)
