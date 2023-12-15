RegisterCommand('giveweapon', function(_, args) 
    local target = args[1]
    local weapon = GetHashKey(args[2])
    local ammo = tonumber(args[3])
    print(json.encode(args))
    print(type(weapon))
    print(GetHashKey(weapon))

    if not target or not weapon then
        TriggerEvent('chat:addMessage', {
            args = {"Usage: /giveweapon [target] [weapon]"}
        })
        return
    end

    if not IsWeaponValid(weapon) then 
        TriggerEvent('chat:addMessage', {
            args = {'Uh oh, ' .. weapon .. ' is not a valid weapon hash'}
        })
        return
    end

    if type(ammo) ~= "number" then
        TriggerEvent('chat:addMessage', {
            args = {"You must give the amount of ammo"}
        })
        return
    end


    TriggerServerEvent('kr_giveweapon:give', target, weapon, ammo)
end)