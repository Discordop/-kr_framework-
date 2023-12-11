RegisterNetEvent('kr_teleporter:goto', function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local targetPed = GetPlayerPed(targetId)
    local targetPos = GetEntityCoords(targetPed)

    if targetPed <= 0 then 
        TriggertClientEvent('chat:addMessage', playerId, {
            args = { 'Sorry, ' .. targetId .. ' doesn\'t seem to exist.', },
        })

        return
    end
    -- Get coordinates of target

    SetEntityCoords(playerPed, targetPos)

    end)

RegisterNetEvent('kr_teleporter:summon', function(targetId)
    local playerId = source
    local playerPed = GetPlayerPed(playerId)
    local playerPos = GetEntityCoords(playerPed)
    local targetPed = GetPlayerPed(targetId)
    
    if targetPed <= 0 then 
        TriggerClientEvent('chat:addMessage', playerId, {
            args = { 'Sorry, ' .. targetId .. ' doesn\'t seem to exist.', },
        })

        return
    end

    SetEntityCoords(targetPed, playerPos)

end)