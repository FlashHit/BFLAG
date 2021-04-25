Events:Subscribe('Level:LoadResources', function()
	if SharedUtils:GetLevelName() == "Levels/MP_001/MP_001" and SharedUtils:GetCurrentGameMode() == "ConquestSmall0" then
		if ServerUtils:GetCustomGameModeName() == nil or ServerUtils:GetCustomGameModeName() ~= 'BFLAG' then
			ServerUtils:SetCustomGameModeName('BFLAG')
		end
	elseif ServerUtils:GetCustomGameModeName() ~= nil and ServerUtils:GetCustomGameModeName() == 'BFLAG' then
		ServerUtils:ClearCustomGameModeName()
	end
end)

Events:Subscribe('Level:Loaded', function()
	if ServerUtils:GetCustomGameModeName() == nil or ServerUtils:GetCustomGameModeName() ~= 'BFLAG' then
		return
	end
	CaptureFlags()
end)

function CaptureFlags()
	local s_Iterator = EntityManager:GetIterator("ServerCapturePointEntity")
	local s_Entity = s_Iterator:Next()
	while s_Entity do
		s_Entity = CapturePointEntity(s_Entity)
		if s_Entity.name == "ID_H_US_A" then
			s_Entity.team = TeamId.Team1
			s_Entity.isControlled = true
			s_Entity.flagLocation = 100.0
			s_Entity.flagHome = 100.0
		elseif s_Entity.name == "ID_H_US_C" then
			s_Entity.team = TeamId.Team2
			s_Entity.isControlled = true
			s_Entity.flagLocation = 100.0
			s_Entity.flagHome = 100.0
		end
		s_Entity = s_Iterator:Next()
	end
end
