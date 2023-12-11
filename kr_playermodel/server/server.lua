RegisterNetEvent('kr_playermodel:changemodel', function(model)
    local playerId = source

    SetPlayerModel(playerId, model)
end)