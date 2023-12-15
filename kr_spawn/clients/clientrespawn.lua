print("servers/respawn.lua was loaded")
local spawnLocs = {
    { 721.4659, 522.6744, 130.2456 },
    { 657.0517, 481.4385, 139.8458 },
    { 570.5782, 509.1592, 144.6453 },
    { 637.7491, 582.5757, 129.0457 },
    { 679.5257, 524.9391, 130.2288 }
}
function RespawnPed(player)
  -- exports['progressBars']:startUI(1000, "Respawning")
    Wait(1000)
    local t
    if not IsPlayerSwitchInProgress() then
        SwitchOutPlayer((player), 0, 1)
    end

    t = CreateThread(function ()
        SetCloudHatOpacity(0.1)
        HideHudAndRadarThisFrame()
    end)

    while GetPlayerSwitchState() ~= 5 do
        Wait(1)
    end        
    
    local entityPos = GetEntityCoords(player)
    local heading = GetEntityHeading(player)

    FreezeEntityPosition(player, true)
    print("TELEPORTING")
    SetEntityCoords(player, -447.8189, -341.0914, 34.5018, false, false, false, true)
    NetworkResurrectLocalPlayer(-447.8189, -341.0914, 34.5018, heading,false, false)
    SetPlayerInvincible(player, false)
    ClearPedBloodDamage(player)

    SwitchInPlayer(player)

    while GetPlayerSwitchState() ~= 12 do
        Wait(1)
    end
    print("Terminating Thread")
    TerminateThread(t)

    FreezeEntityPosition(player, false)
end

AddEventHandler('gameEventTriggered', function(event, args)
    -- If the game event was the damage event and it killed the entity (args[6] = wasFatal)
    if event == "CEventNetworkEntityDamage" and args[6] >= 1 then
        print(args[1])
        if not IsPedAPlayer(args[1]) then 
            return
        end 
        print("Respawning")
        
        local chosenRespawn = math.random(#spawnLocs)
        local respawnPos = vector3(spawnLocs[chosenRespawn][1], spawnLocs[chosenRespawn][2], spawnLocs[chosenRespawn][3])
        local playerPed = PlayerPedId()



        print("Triggering Event")
        print("PLAYER PED: ", playerPed)
        RespawnPed(playerPed)
    end
end)