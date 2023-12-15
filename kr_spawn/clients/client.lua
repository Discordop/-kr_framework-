local spawnPos = vector3(721.4659, 522.6744, 130.2456)

AddEventHandler('onClientGameTypeStart', function()
    exports.spawnmanager:setAutoSpawnCallback(function()
        exports.spawnmanager:spawnPlayer({
            x = spawnPos.x,
            y = spawnPos.y,
            z = spawnPos.z,
            model = 'a_m_y_musclbeac_01',
        }, function()
            TriggerEvent('chat:addMessage', {
                args = { 'Welcome to the development server WOOOO!', }
            })
        end)
    end)
    exports.spawnmanager:setAutoSpawn(false)
    exports.spawnmanager:forceRespawn()
end)
