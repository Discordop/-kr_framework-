RegisterNetEvent('kr_giveweapon:give', function(target, weapon, ammo)
    local playerId = source;
    local ped = GetPlayerPed(target);
    local weaponHash = weapon;
    print(weaponHash)
    GiveWeaponToPed(ped,weaponHash,ammo,false,true)
    TriggerClientEvent('chat:addMessage', playerId, {
        args = { 'Successful: Received their weapon!', },
    })
end)