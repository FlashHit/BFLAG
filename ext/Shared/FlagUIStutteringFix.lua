ResourceManager:RegisterInstanceLoadHandler(Guid('37281D8D-BB5A-11DF-B69D-B42F116347F5'), Guid('DD387B90-E2E8-1408-A934-9ADEC54F54B1'), function(p_Instance)
	if SharedUtils:GetLevelName() ~= "Levels/MP_001/MP_001" or SharedUtils:GetCurrentGameMode() ~= "ConquestSmall0" then
		return
	end
	p_Instance = UICapturepointtagCompData(p_Instance)
	p_Instance:MakeWritable()
	p_Instance.updatesPerSecond = 100
	p_Instance.iconSize = 0.0
	p_Instance.drawDistance = 48.0
	p_Instance.scaleDistance = 0.0
end)
