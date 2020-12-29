function Aimglitchfix()

local trigger = false
local hipFireTrigger = false
weaponFiring = Events:Subscribe('WeaponFiring:Update', function(weaponFiring)
--	print("minAngle: " .. GunSwayDispersionData(GunSwayBaseMoveJumpData(GunSwayStandData(GunSwayData(weaponFiring.gunSway.data).stand).noZoom).baseValue).minAngle)
	-- default value of the gun but the modifiers are missing...
--	print("dispersionAngle: " .. weaponFiring.gunSway.dispersionAngle)
	
--[[for i,modifier in pairs(GunSwayData(weaponFiring.gunSway.data).modifiers) do
		print(GunSwayDispersionModData(GunSwayStanceZoomModifierData(GunSwayModifierData(modifier).standNoZoomModifier).dispersionMod).minAngleModifier)
	end ]]
	-- this prints all modifiers but even the ones that are not equipped... 0.5 is redlaser pointer for example and minAngle*0.5 = dispersionAngle

	if trigger == true and weaponFiring.gunSway ~= nil then
		weaponFiring.gunSway.dispersionAngle = 2.5 --i should get the default value of that gun instead of choosing one value for all guns
		trigger = false
	end
	--if weaponFiring.gunSway ~= nil and weaponFiring.gunSway.dispersionAngle < 2.5 then --same here, it should be "if smaller then default spread"
	--[[if InputManager:IsDown(InputConceptIdentifiers.ConceptZoom) == false then
			weaponFiring.gunSway.dispersionAngle = 2.5 --same here
		end]]
		--this one could work better if I just had the right value otherwise it makes the default crosshairs, which is smaller, bigger...
		
		--[[ HIPFIRE FIX
		if InputManager:IsDown(InputConceptIdentifiers.ConceptFire) and InputManager:IsDown(InputConceptIdentifiers.ConceptZoom) then
			hipFireTrigger = true
		end
		if InputManager:IsDown(InputConceptIdentifiers.ConceptFire) and InputManager:IsDown(InputConceptIdentifiers.ConceptZoom) == false and hipFireTrigger == true then
			hipFireTrigger = false
			weaponFiring.gunSway.dispersionAngle = 2.5 --i should get the default value of that gun instead of choosing one value for all guns
		end]]
	--end
end)
engineMessage = Events:Subscribe('Engine:Message', function(message)
	if message.type == 638585794 then
		--weaponChanging event message
		trigger = true
	end
end)

end

return Aimglitchfix