AddEventHandler("playerSpawned", function(spawn)

    print("Playher spawned turning ff on")
	local ped = PlayerPedId()
	SetCanAttackFriendly(ped, true, true)
    NetworkSetFriendlyFireOption(true)
    print("DISABLING INSTA KILL HEADSHOT")
    SetPedSuffersCriticalHits(ped, false)
end)