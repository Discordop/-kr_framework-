emergency_vehicles = {
    "OPP1", "OPP2", "OPP3", "OPP4", "OPP5", "OPP6", "OPP7", "OPP8", "OPP9", "OPP10"
}
local vehicleLocked = true;

print("client/loops.lua is loaded")
CreateThread(function()
    local playerId = PlayerPedId()
    while true do
        Wait(400)
        local vehicle = GetVehiclePedIsTryingToEnter(playerId)
        if IsPedGettingIntoAVehicle(playerId) and vehicleLocked then
            SetVehicleDoorsLocked(vehicle, 2)
        else
            print("smashing window")
            SmashVehicleWindow(vehicle, 0)
        end
    end
end
)

CreateThread(function()
    local playerId = PlayerPedId()
    local playerVehicle = GetVehiclePedIsIn(playerId, false)
    local vehicleHash = GetEntityModel(playerVehicle)
    while true do
        Wait(0)
        if containsItem(emergency_vehicles, GetDisplayNameFromVehicleModel(vehicleHash)) and GetPedInVehicleSeat(playerVehicle, -1) == playerId then
            DisableControlAction(0, 85, true)
        end
    end
end)
