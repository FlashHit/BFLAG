ResourceManager:RegisterInstanceLoadHandler(Guid('C98941E6-B300-4D5F-BC2E-ECA03DBF855D'), Guid('539342BE-2504-4D4F-A60B-8EC27DB005C2'), function(p_Instance)
	p_Instance = SubWorldData(p_Instance)
	p_Instance:MakeWritable()
	local s_Registry = RegistryContainer()
	local s_Partition = DatabasePartition((ResourceManager:FindPartitionForInstance(p_Instance)))
	local s_ShortWall = ResourceManager:FindInstanceByGuid(Guid('B6F8ACAB-040F-11DE-BEED-FF559017A74C'), Guid('B6F8ACAC-040F-11DE-BEED-FF559017A74C'))
	if s_ShortWall ~= nil then
		s_ShortWall = ObjectBlueprint(s_ShortWall)
		local s_ShortWallReference = ReferenceObjectData(MathUtils:RandomGuid())
		s_ShortWallReference.blueprintTransform = LinearTransform(
			Vec3(1.0, 0.0, 0.0),
			Vec3(0.0, 0.50770181417465, 0.0),
			Vec3(0.0, 0.0, 1.0),
			Vec3(-59.718528747559, 74.845832824707, 15.243971824646)
		)
		s_ShortWallReference.blueprint = s_ShortWall
		p_Instance.objects:add(s_ShortWallReference)
		s_Partition:AddInstance(s_ShortWallReference)
		s_Registry.referenceObjectRegistry:add(s_ShortWallReference)
	end
	local s_Wall = ResourceManager:FindInstanceByGuid(Guid('82DAAAFA-040D-11DE-BEED-FF559017A74C'), Guid('82DAAAFB-040D-11DE-BEED-FF559017A74C'))
	if s_Wall ~= nil then
		s_Wall = ObjectBlueprint(s_Wall)
		local s_WallReference = ReferenceObjectData(MathUtils:RandomGuid())
		s_WallReference.blueprintTransform = LinearTransform(
			Vec3(1.0, 0.0, 0.0),
			Vec3(0.0, 1.0, 0.0),
			Vec3(0.0, 0.0, 1.0),
			Vec3(-65.39, 72.63, 44.26)
		)
		s_WallReference.blueprint = s_Wall
		p_Instance.objects:add(s_WallReference)
		s_Partition:AddInstance(s_WallReference)
		s_Registry.referenceObjectRegistry:add(s_WallReference)
	end
	ResourceManager:AddRegistry(s_Registry, ResourceCompartment.ResourceCompartment_Game)
end)
