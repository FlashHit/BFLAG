
function MoveFlagpole()

local flagCount = 0

local flagTransform = LinearTransform(
	Vec3(1, 0, 0),
	Vec3(0, 1, 0),
	Vec3(0, 0, 1),
	Vec3(-68.6, 81.8, 7))

-- Change flagpole position
entityFactoryCreateFromBlueprint2 = Hooks:Install('EntityFactory:CreateFromBlueprint', 1, function(hook, blueprint, transform, variation, parentRepresentative)
    if SharedUtils:GetLevelName() == "Levels/MP_001/MP_001" and SharedUtils:GetCurrentGameMode() == "ConquestSmall0" and blueprint ~= nil then
		
		blueprint = Blueprint(blueprint)

		if blueprint.name == "Gameplay/Level_Setups/Components/CapturePointPrefab" then

			flagCount = flagCount + 1

			if flagCount == 2 then

				parentRepresentative = ReferenceObjectData(parentRepresentative)
				parentRepresentative:MakeWritable()
				parentRepresentative.blueprintTransform = flagTransform

				transform = flagTransform

				hook:Pass(blueprint, transform, variation, parentRepresentative)
				return
			end
		end
	else
		hook:Pass(blueprint, blueprint, variation, parentRepresentative)
	end
end)

levelLoaded = Events:Subscribe('Level:Loaded', function()
	
	flagCount = 0
	
end)

end

return MoveFlagpole