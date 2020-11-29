local MoveFlagpole = require('__shared/moveFlagpole')
local OtherStuff = require('__shared/otherStuff')

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
	
	local levelDestroyEvent = Events:Subscribe('Level:Destroy', OnLevelDestroy)


	-- Don't do anything if the wrong level/gamemode is loaded
	if levelName ~= "Levels/MP_001/MP_001" or gameMode ~= "ConquestSmall0" then
		levelDestroyEvent:Unsubscribe()
		return
	end
	
	MoveFlagpole()
	
	OtherStuff()
end)

-- Deregistering, uninstalling and uninstalling in case the next level isn't MP_001
function OnLevelDestroy()

	index = 1
    flagCount = 0
    flagTransforms = {}
	
	entityFactoryCreateFromBlueprint = nil
	entityFactoryCreateFromBlueprint2 = nil
	levelLoaded = nil
	
	an94part1 = nil
	an94part2 = nil
	
end
