--US
ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('7C8B0483-17DC-4059-8267-EC00E634EFA9'), function(p_Instance)
	p_Instance = ReferenceObjectData(p_Instance)
	p_Instance:MakeWritable()
	p_Instance.excluded = true
end)

--RU
ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('6FF841E5-B527-4BD4-903E-AB8570E2DB87'), function(p_Instance)
	p_Instance = ReferenceObjectData(p_Instance)
	p_Instance:MakeWritable()
	p_Instance.excluded = true
end)

-- Capture A and C instead of the bases
ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('8C5AF081-DC1E-42BE-9F88-E9A354616B43'), function(p_Instance)
	local s_SubWorldData = SubWorldData(ResourceManager:FindInstanceByGuid(Guid('C98941E6-B300-4D5F-BC2E-ECA03DBF855D'), Guid("539342BE-2504-4D4F-A60B-8EC27DB005C2")))
	s_SubWorldData:MakeWritable()
	for l_Index, l_PropertyConnection in pairs(s_SubWorldData.propertyConnections) do
		if l_PropertyConnection.targetFieldId == MathUtils:FNVHash("InitialOwnerTeam") then
			if l_PropertyConnection.target.instanceGuid == Guid("7C8B0483-17DC-4059-8267-EC00E634EFA9") then
				s_SubWorldData.propertyConnections[l_Index].target = ReferenceObjectData(p_Instance)
			elseif l_PropertyConnection.target.instanceGuid == Guid("6FF841E5-B527-4BD4-903E-AB8570E2DB87") then
				s_SubWorldData.propertyConnections[l_Index].target = ReferenceObjectData(ResourceManager:FindInstanceByGuid(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid("185D7F07-F84A-4840-A5D3-4282B04A4898")))
			end
		end
	end
end)

-- Remove flagpoles
ResourceManager:RegisterInstanceLoadHandler(Guid('09EC6C92-BCE4-11E0-8467-9159D6ACA94C'), Guid('237DADC8-CF6A-4D39-BFBA-65CAAB6DC46A'), function(p_Instance)
	p_Instance = CapturePointEntityData(p_Instance)
	p_Instance:MakeWritable()
	p_Instance.flagTemplates:clear()
	p_Instance.capturePoint = nil
end)
