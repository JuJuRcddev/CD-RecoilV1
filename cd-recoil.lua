local weapons = {
    -- {To add a gun to have recoil} - Copy and Paste a line of the code (Replace The command) - ("WEAPON_PISTOL") - ("WEAPON_SMG")

    -- {You can customize all the guns Recoil, Shake}

    -- (To remove the recoil or shake delete the Line) {, shake = 0.05} -- Make sure you remove the , to and it should look like this - [GetHashKey("WEAPON_STUNGUN")] = {recoil = 0.4}, or -- [GetHashKey("WEAPON_STUNGUN")] = {shake = 0.05},
    -- Code = start
	[GetHashKey('WEAPON_FN509')] = {recoil = 0.2, shake = 0.04}, 	--PISTOL	
	[GetHashKey('WEAPON_GLOCK17')] = {recoil = 0.2, shake = 0.04}, 	--PISTOL MK2
	[GetHashKey('WEAPON_GLOCK17X')] = {recoil = 0.2, shake = 0.04}, -- COMBAT PISTOL
	[GetHashKey('WEAPON_MINIARP')] = {recoil = 0.2, shake = 0.04}, -- COMBAT PISTOL
	[GetHashKey('WEAPON_P80')] = {recoil = 0.2, shake = 0.04}, -- AP PISTOL
	[GetHashKey('WEAPON_GLOCK26')] = {recoil = 0.2, shake = 0.04}, -- MWR
	[GetHashKey('WEAPON_GHOSTGLOCK')] = {recoil = 0.2, shake = 0.04}, -- MR6
	[GetHashKey('WEAPON_GLOCK22')] = {recoil = 0.2, shake = 0.04}, -- MR61
	[GetHashKey('WEAPON_PF940')] = {recoil = 0.2, shake = 0.04}, -- TX22
	[GetHashKey('WEAPON_RUGER57')] = {recoil = 0.2, shake = 0.04}, -- TX22V2
	[GetHashKey('WEAPON_TAURUSG2C')] = {recoil = 0.2, shake = 0.04}, -- SHREWSBURY
	[GetHashKey('WEAPON_FN15')] = {recoil = 0.2, shake = 0.04}, -- AC
}


--
---
----
----- Do not edit the code below!

-- This is your recoil/shake command codes!

CreateThread(function()
	while true do
		Wait(0)
		local ped = PlayerPedId()
		local weapon = GetSelectedPedWeapon(ped)
		for hash, data in pairs(weapons) do
			if weapon == hash then	
				if IsPedShooting(ped) then
					ShakeGameplayCam('SMALL_EXPLOSION_SHAKE', data.shake)
				end
			end
		end
	end
end)

CreateThread(function()
	while true do
		Wait(0)
		if IsPedShooting(PlayerPedId()) and not IsPedDoingDriveby(PlayerPedId()) then
			local _,wep = GetCurrentPedWeapon(PlayerPedId())
			_,cAmmo = GetAmmoInClip(PlayerPedId(), wep)
			if weapons[wep].recoil and weapons[wep].recoil ~= 0 then
				tv = 0
				repeat 
					Wait(0)
					p = GetGameplayCamRelativePitch()
					if GetFollowPedCamViewMode() ~= 4 then
						SetGameplayCamRelativePitch(p+0.1, 0.2)
					end
					tv = tv+0.1
				until tv >= weapons[wep].recoil
			end
			
		end
	end
end)