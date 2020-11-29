
function OtherStuff()
-- Remove cardboard boxes when destroyed and remove ambient effects like flying trash
entityFactoryCreateFromBlueprint = Hooks:Install('EntityFactory:CreateFromBlueprint', 1, function(hook, blueprint, transform, variation, parentRepresentative)
	if SharedUtils:GetLevelName() == "Levels/MP_001/MP_001" and SharedUtils:GetCurrentGameMode() == "ConquestSmall0" then
		blueprint = Blueprint(blueprint)

		if blueprint.name:match("FX/Ambient") then
		
			hook:Return()	
			
		end

		if blueprint.name:match("Props/BuildingProps/CardboardBox_01") then
		
			hook:Return()	
			
		end
		
	end
end)

-- Fix flag progress bug and hide flag tags beyond 48 meters
flagProgress = ResourceManager:RegisterInstanceLoadHandler(Guid('37281D8D-BB5A-11DF-B69D-B42F116347F5'), Guid('DD387B90-E2E8-1408-A934-9ADEC54F54B1'), function(instance)
  	
  	local tagCompData = UICapturepointtagCompData(instance)
 	tagCompData:MakeWritable()
	tagCompData.updatesPerSecond = 100
	tagCompData.iconSize = 0.0
	tagCompData.drawDistance = 48.0 
	tagCompData.scaleDistance = 0.0
end)

end

return OtherStuff