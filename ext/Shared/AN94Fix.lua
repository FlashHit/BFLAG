ResourceManager:RegisterInstanceLoadHandler(Guid('37A1075D-0467-11E0-A970-FF10D557871E'), Guid('B4E31807-4480-4393-93C0-8B4DFACC6A53'), function(p_Instance)
	p_Instance = FiringFunctionData(p_Instance)
	p_Instance:MakeWritable()
	FireLogicData(p_Instance.fireLogic).rateOfFireForBurst = 800
	FireLogicData(p_Instance.fireLogic).rateOfFire = 600
end)

ResourceManager:RegisterInstanceLoadHandler(Guid('37A1075D-0467-11E0-A970-FF10D557871E'), Guid('A3CE0336-7E49-4094-A651-8ACA0CDEA8AE'), function(p_Instance)
	p_Instance = FiringFunctionData(p_Instance)
	p_Instance:MakeWritable()
	FireLogicData(p_Instance.fireLogic).rateOfFireForBurst = 800
	FireLogicData(p_Instance.fireLogic).rateOfFire = 600
end)
