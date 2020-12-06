
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
		
		-- The store sign will disappear instead of falling down
		if blueprint.name:match("Props/BuildingProps/ME_StoreSignSet/") then
		
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

-- Fix the preview cameras for B
flagCamera = ResourceManager:RegisterInstanceLoadHandler(Guid('C98941E6-B300-4D5F-BC2E-ECA03DBF855D'), Guid('C4F7368E-4783-C08E-CBB9-66521D0AD158'), function(instance)
	if SharedUtils:GetLevelName() == "Levels/MP_001/MP_001" and SharedUtils:GetCurrentGameMode() == "ConquestSmall0" then
		instance = InterfaceDescriptorData(instance)
		instance:MakeWritable()
		instance.fields[3].value = 'LinearTransform ((0.98216074705124, 0.048190776258707, 0.18176361918449),(-0.0067436555400491, 0.97500890493393, -0.22206361591816),(-0.18792253732681, 0.21687638759613, 0.95794034004211),(4.077354431152, -0.392906188965, 22.938781738281))'
		instance.fields[4].value = 'LinearTransform ((-0.94940805435181, 0.048190597444773, 0.31032577157021),(0.10450667142868, 0.98031860589981, 0.16749280691147),(-0.29614654183388, 0.19145013391972, -0.93575859069824),(4.23112487793, 0.000360595703, -17.490152359009))'
	end
end)

end

return OtherStuff
