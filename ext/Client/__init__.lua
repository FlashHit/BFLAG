local Aimglitchfix = require('aimglitchfix')
local OtherStuff = require('otherStuff')

Events:Subscribe('Level:LoadResources', function(levelName, gameMode, isDedicatedServer)
	
	local levelDestroyEvent = Events:Subscribe('Level:Destroy', OnLevelDestroy)


	-- Don't do anything if the wrong level/gamemode is loaded
	if levelName ~= "Levels/MP_001/MP_001" or gameMode ~= "ConquestSmall0" then
		levelDestroyEvent:Unsubscribe()
		return
	end
	
	Aimglitchfix()
	OtherStuff()
end)

-- Deregistering, uninstalling and uninstalling in case the next level isn't MP_001
function OnLevelDestroy()
	
	entityFactoryCreateFromBlueprint = nil
	flagProgress = nil
	
end

-- Region Fix Chatlag
ResourceManager:RegisterInstanceLoadHandler(Guid('3E6AF1E2-B10E-11DF-9395-96FA88A245BF'), Guid('78B3E33E-098B-3320-ED15-89A36F04007B'), function(instance)
	instance = UIMessageCompData(instance)
	instance:MakeWritable()
	MessageInfo(instance.chatMessageInfo).messageQueueSize = 6
end)
--Endregion
