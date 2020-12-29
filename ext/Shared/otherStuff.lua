function OtherStuff()
   
local index = 1
local flagCount = 0
local flagTransforms = {}

entityFactoryCreateFromBlueprint = Hooks:Install('EntityFactory:CreateFromBlueprint', 1, function(hook, blueprint, transform, variation, parentRepresentative)
	if SharedUtils:GetLevelName() == "Levels/MP_001/MP_001" and SharedUtils:GetCurrentGameMode() == "ConquestSmall0" and blueprint ~= nil then
	
		blueprint = Blueprint(blueprint)

		-- The 3 CPs (flags) always get created before the HQs (bases)
		if blueprint.name == "Gameplay/Level_Setups/Components/CapturePointPrefabFlagpole" then
			
			flagCount = flagCount + 1

			-- Store the transform of the flags so we can create the HQs in the same place
			flagTransforms[flagCount] = transform:Clone()
		end

		if blueprint.name == "Gameplay/Level_Setups/Components/CapturePointPrefab_HQ" then

			-- The 1st HQ gets created in the same place as the 1st CP (index = 1)
			parentRepresentative = ReferenceObjectData(parentRepresentative)
			parentRepresentative:MakeWritable()
			parentRepresentative.blueprintTransform = flagTransforms[index]

			hook:Pass(blueprint, flagTransforms[index], variation, parentRepresentative)

			-- The 2nd HQ gets created in the same place as the 3rd CP
			index = 3
		end
		
	end
end)

-- Overwrite the redzones/out of bound areas
ruRedzone = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('97AE25B9-38D6-451B-BDEF-723FDB67E4B9'), function(instance)

  	local redZoneRU = VolumeVectorShapeData(instance)
 	redZoneRU:MakeWritable()
	redZoneRU.points:clear()
	local points = { Vec3(-134.463104, 75.476578, -15.044505), Vec3(-136.239487, 75.394234, -15.026852), Vec3(-137.245911, 75.321053, -46.568855), Vec3(-140.198730, 73.844879, -91.941154), Vec3(-135.106903, 74.023735, -94.476357), Vec3(-120.090767, 74.178581, -115.240105), Vec3(-99.575081, 74.476601, -121.447945), Vec3(-43.097668, 74.172623, -125.143616), Vec3(-42.730236, 74.063400, -94.798477), Vec3(-52.120689, 74.350853, -74.403923), Vec3(-52.383671, 80.710655, -66.203247), Vec3(-54.935074, 80.850060, -60.444386), Vec3(-52.821133, 75.584183, -43.994667), Vec3(-53.144844, 75.766029, -40.241924), Vec3(-22.175495, 78.796593, 1.183757), Vec3(-22.175493, 78.631592, 10.747160), Vec3(-23.374050, 75.010429, 29.529671), Vec3(-28.930784, 75.010429, 29.318220), Vec3(-49.788681, 79.102310, 29.703030), Vec3(-53.466496, 77.408806, 29.671089), Vec3(-59.378937, 78.727394, 29.702610), Vec3(-59.706249, 76.751305, 28.975767), Vec3(-65.074463, 76.752327, 28.753723), Vec3(-96.001747, 77.476089, 26.523724), Vec3(-95.998207, 77.930611, 16.935411) }
	for _,point in pairs(points) do
		redZoneRU.points:add(point)
	end
end)
usRedzone = ResourceManager:RegisterInstanceLoadHandler(Guid('3F235412-5694-44DC-9DBE-5D8D500DC1F5'), Guid('A68755C4-1037-49E3-87C5-C0A4FB3A15B4'), function(instance)

  	local redZoneUS = VolumeVectorShapeData(instance)
 	redZoneUS:MakeWritable()
	redZoneUS.points:clear()																	
	points = { Vec3(-3.440399, 74.060837, 50.669987), Vec3(1.545925, 73.844887, 53.416454), Vec3(1.425409, 73.844872, 90.978142), Vec3(-7.508579, 74.096275, 110.005455), Vec3(-59.974880, 74.171738, 127.278183), Vec3(-83.028854, 72.195129, 111.095451), Vec3(-79.344688, 75.939804, 85.633736), Vec3(-70.285027, 75.592751, 44.283993), Vec3(-70.230057, 75.405586, 37.072029), Vec3(-95.998375, 77.657623, 26.535435), Vec3(-96.001747, 77.703178, 16.948963), Vec3(-70.584206, 78.534325, -9.145922), Vec3(-59.684055, 76.752335, -9.138090), Vec3(-57.881222, 77.312645, -9.023028), Vec3(-22.175493, 78.864273, 1.158613), Vec3(-22.175493, 79.120743, 10.758198), Vec3(-18.831909, 75.822678, 27.705421) }
	for _,point in pairs(points) do
		redZoneUS.points:add(point)
	end
end)

-- Spawnpositions
usSpawn1 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('1A8FD289-22CB-4191-9FC2-C868D50750BB'), function(instance) -- usspawn 1
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(0.48871467, 0.0, -0.8724438), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(0.8724438, 0.0, 0.48871467), 
		Vec3(-78.39306, 75.55652, 87.76184))
end)
usSpawn2 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('D88D780D-C8E5-42A3-BC9E-81D296C24FFA'), function(instance) -- usspawn 2
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(0.74736434, 0.0, -0.6644145), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(0.6644145, 0.0, 0.74736434), 
		Vec3(-68.43972, 75.20088, 58.481773))
end)
usSpawn3 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('54193D14-AAFE-4C6C-9FBB-2577B5E9D95D'), function(instance) -- usspawn 3
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(0.736133, 0.0, 0.67683697), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.67683697, 0.0, 0.736133), 
		Vec3(-16.757757, 74.07002, 46.65799))
end)
usSpawn4 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('1AF4A95F-F48D-4333-9383-6850877FE347'), function(instance) -- usspawn 4
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.9964775, 0.0, 0.08385812), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.08385812, 0.0, -0.9964775), 
		Vec3(-21.530289, 74.03359, 111.60792))
end)
usSpawn5 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('739094C4-88E7-492B-BC12-0D7506FABD8D'), function(instance) -- usspawn 5
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(0.24611466, 0.0, 0.96924067), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.96924067, 0.0, 0.24611466), 
		Vec3(-10.399093, 74.02327, 82.65426))
end)
usSpawn6 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('5A3AFC5F-63CC-46E3-9CAF-703CD12111C8'), function(instance) -- usspawn 6
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.40802383, 0.0, 0.9129712), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.9129712, 0.0, -0.40802383), 
		Vec3(-10.539265, 74.023285, 65.27911))
end)
usSpawn7 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('62BD0BDF-62A2-4B3D-95BF-56DD2875805B'), function(instance) -- usspawn 7
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.9923818, 0.0, -0.12320044), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(0.12320044, 0.0, -0.9923818), 
		Vec3(-39.790672, 73.84488, 111.3934))
end)
usSpawn8 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('96BE5C7E-2F15-451D-BA7F-82A633E1C345'), function(instance) -- usspawn 8
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(0.7782005, 0.0, -0.6280159), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(0.6280159, 0.0, 0.7782005), 
		Vec3(-29.777752, 74.02331, 49.63987))
end)
usSpawn10 = ResourceManager:RegisterInstanceLoadHandler(Guid('09404C9B-E5D6-4135-B7E2-18F7590A3C6B'), Guid('EB0607ED-156C-412D-A63C-856839C82F3E'), function(instance) -- usspawn 10
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.86081547, 0.0, -0.50891715), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(0.50891715, 0.0, -0.86081547), 
		Vec3(-56.357517, 74.02333, 114.08502))
end)
ruSpawn1 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('F6E349C7-0880-4DFC-B88A-F2D4E43E74AD'), function(instance) -- ruspawn 1
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.029706312, 0.0, -0.9995586), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(0.9995586, 0.0, -0.029706312), 
		Vec3(-131.11574, 75.094894, -55.106506))
end)
ruSpawn2 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('AF9A4638-4D01-401C-8B4A-C7CE035809AC'), function(instance) -- ruspawn 2
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(0.48725823, 0.0, 0.87325794), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.87325794, 0.0, 0.48725823), 
		Vec3(-79.51997, 74.07768, -107.76956))
end)
ruSpawn3 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('60840A76-9A60-4A25-8457-08B305E63B31'), function(instance) -- ruspawn 3
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.97965324, 0.0, 0.20069742), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.20069742, 0.0, -0.97965324), 
		Vec3(-124.363914, 75.094894, -26.47222))
end)
ruSpawn4 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('CE22977C-385C-4D6C-BD05-4E4ACBE18A72'), function(instance) -- ruspawn 4
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.0062240395, 0.0, 0.9999807), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.9999807, 0.0, -0.0062240395), 
		Vec3(-52.798008, 75.14468, -72.75014))
end)
ruSpawn5 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('D0ED860F-9AF9-4F3C-8F96-C860DCB73ED5'), function(instance) -- ruspawn 5
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.2931475, 0.0, -0.9560673), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(0.9560673, 0.0, -0.2931475), 
		Vec3(-90.724846, 75.25528, -38.636124))
end)
ruSpawn6 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('8C7FE07D-750A-46A2-8698-9106B5861A8C'), function(instance) -- ruspawn 6
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.07294154, 0.0, 0.9973363), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.9973363, 0.0, -0.07294154), 
		Vec3(-84.7861, 80.37533, -40.294884))
end)
ruSpawn7 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('E7F9B3D0-C63E-4231-9F61-766F6C7E52CC'), function(instance) -- ruspawn 7
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(0.9998767, -3.27629e-11, 0.015701802), 
		Vec3(3.0476816e-11, 0.99999994, 1.458333e-10), 
		Vec3(-0.0157018, -1.4533684e-10, 0.9998767), 
		Vec3(-70.18849, 74.023315, -93.3242))
end)
ruSpawn8 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('205DB9CD-A708-4B3D-8CFE-E3C0839D7AE5'), function(instance) -- ruspawn 8
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(0.9578513, 0.0, 0.28726465), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.28726465, 0.0, 0.9578513), 
		Vec3(-106.64252, 74.03139, -92.30574))
end)
ruSpawn9 = ResourceManager:RegisterInstanceLoadHandler(Guid('77BA4A7E-2620-480E-B8DB-301CAC302CA8'), Guid('CB79DAA1-B1BC-4E52-8129-B445F6394FC2'), function(instance) -- ruspawn 9
	instance = AlternateSpawnEntityData(instance)
	instance:MakeWritable()
	instance.transform = LinearTransform(
		Vec3(-0.07294154, 0.0, 0.9973363), 
		Vec3(0.0, 1.0, 0.0), 
		Vec3(-0.9973363, 0.0, -0.07294154), 
		Vec3(-84.7861, 80.37533, -40.294884))
end)

-- Fix An94 Burst
an94part1 = ResourceManager:RegisterInstanceLoadHandler(Guid('37A1075D-0467-11E0-A970-FF10D557871E'), Guid('B4E31807-4480-4393-93C0-8B4DFACC6A53'), function(instance)
	instance = FiringFunctionData(instance)
	instance:MakeWritable()
	FireLogicData(instance.fireLogic).rateOfFireForBurst = 800
	FireLogicData(instance.fireLogic).rateOfFire = 600
end)
an94part2 = ResourceManager:RegisterInstanceLoadHandler(Guid('37A1075D-0467-11E0-A970-FF10D557871E'), Guid('A3CE0336-7E49-4094-A651-8ACA0CDEA8AE'), function(instance)
	instance = FiringFunctionData(instance)
	instance:MakeWritable()
	FireLogicData(instance.fireLogic).rateOfFireForBurst = 800
	FireLogicData(instance.fireLogic).rateOfFire = 600
end)
end

bazaarObjects = ResourceManager:RegisterInstanceLoadHandler(Guid('C98941E6-B300-4D5F-BC2E-ECA03DBF855D'), Guid('539342BE-2504-4D4F-A60B-8EC27DB005C2'), function(instance)
	instance = SubWorldData(instance)
	instance:MakeWritable()
	local registry = RegistryContainer()
	local partition = DatabasePartition((ResourceManager:FindPartitionForInstance(instance)))
	local wallShort = ResourceManager:FindInstanceByGuid(Guid('B6F8ACAB-040F-11DE-BEED-FF559017A74C'), Guid('B6F8ACAC-040F-11DE-BEED-FF559017A74C'))
	if wallShort ~= nil then
		wallShort = ObjectBlueprint(wallShort)
		local wallReference = ReferenceObjectData(MathUtils:RandomGuid())
		wallReference.blueprintTransform = LinearTransform(Vec3(1,0,0), Vec3(0,0.50770181417465,0), Vec3(0,0,1), Vec3(-59.718528747559,74.845832824707,15.243971824646))
		wallReference.blueprint = wall
		instance.objects:add(wallReference)
		partition:AddInstance(wallReference)
		registry.referenceObjectRegistry:add(wallReference)
	end
	local wall = ResourceManager:FindInstanceByGuid(Guid('82DAAAFA-040D-11DE-BEED-FF559017A74C'), Guid('82DAAAFB-040D-11DE-BEED-FF559017A74C'))
	if wall ~= nil then
		wall = ObjectBlueprint(wall)
		local wallReference = ReferenceObjectData(MathUtils:RandomGuid())
		wallReference.blueprintTransform = LinearTransform(Vec3(1,0,0), Vec3(0,1,0), Vec3(0,0,1), Vec3(-65.39,72.63,44.26))
		wallReference.blueprint = wall
		instance.objects:add(wallReference)
		partition:AddInstance(wallReference)
		registry.referenceObjectRegistry:add(wallReference)
	end
	ResourceManager:AddRegistry(registry, ResourceCompartment.ResourceCompartment_Game)
end)

return OtherStuff