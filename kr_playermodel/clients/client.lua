RegisterCommand('changemodel', function(_, args)
    local model = args[1]

    if not IsModelInCdimage(model) or not IsModelAPed(model) then
        TriggerEvent('chat:addMessage', {
            args = { 'Uh oh, ' .. model .. ' is not a vehicle!' }
        })
    return 
    end

    RequestModel(model)

    while not HasModelLoaded(model) do
        wait(10)
    end
    if HasModelLoaded(model) then 
        TriggerEvent('chat:addMessage', {
            args = { model .. ' Has loaded' }
        })
    end
    TriggerServerEvent("kr_playermodel:changemodel", model)

    SetModelAsNoLongerNeeded(model);
end)