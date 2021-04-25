-- Remove cardboard boxes when destroyed and remove ambient effects like flying trash
Hooks:Install('EntityFactory:CreateFromBlueprint', 1, function(p_HookCtx, p_Blueprint, p_Transform, p_Variation, p_ParentRepresentative)
	if SharedUtils:GetLevelName() ~= "Levels/MP_001/MP_001" or SharedUtils:GetCurrentGameMode() ~= "ConquestSmall0" then
		return
	end
	if Blueprint(p_Blueprint).name:match("Props/BuildingProps/CardboardBox_01") then
		p_HookCtx:Return()
	end
end)
