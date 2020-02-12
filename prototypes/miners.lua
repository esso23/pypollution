local pollutionCoefficient = 10

local drills =
{
	{name = "borax-mine", coeff = 1.0},
	{name = "borax-mine-mk02", coeff = 1.0},
	{name = "borax-mine-mk03", coeff = 1.0},
	{name = "borax-mine-mk04", coeff = 1.0},
	{name = "niobium-mine", coeff = 1.0},
	{name = "diamond-mine", coeff = 1.0},
	{name = "regolite-mine", coeff = 1.0},
	{name = "mo-mine", coeff = 1.0},
	{name = "phosphate-mine", coeff = 1.0},
	{name = "rare-earth-mine", coeff = 1.0},
	{name = "quartz-mine", coeff = 1.0},
	{name = "aluminium-mine", coeff = 1.0},
	{name = "chromium-mine", coeff = 1.0},
	{name = "salt-mine", coeff = 1.0},
	{name = "copper-mine", coeff = 1.0},
	{name = "iron-mine", coeff = 1.0},
	{name = "coal-mine", coeff = 1.0},
	{name = "lead-mine", coeff = 1.0},
	{name = "nexelit-mine", coeff = 1.0},
	{name = "nickel-mine", coeff = 1.0},
	{name = "tin-mine", coeff = 1.0},
	{name = "titanium-mine", coeff = 1.0},
	{name = "uranium-mine", coeff = 1.0},
	{name = "zinc-mine", coeff = 1.0},
	{name = "oil-sand-extractor-mk01", coeff = 2.0},
	{name = "oil-sand-extractor-mk02", coeff = 2.0},
	{name = "oil-sand-extractor-mk03", coeff = 2.0},
	{name = "oil-sand-extractor-mk04", coeff = 2.0},
	{name = "oil-derrick-mk01", coeff = 1.0},
	{name = "oil-derrick-mk02", coeff = 0.95},
	{name = "oil-derrick-mk03", coeff = 0.8},
	{name = "oil-derrick-mk04", coeff = 0.65},
	{name = "tar-extractor-mk01", coeff = 2.0},
	{name = "tar-extractor-mk02", coeff = 2.0},
	{name = "tar-extractor-mk03", coeff = 2.0},
	{name = "tar-extractor-mk04", coeff = 2.0},
	{name = "sulfur-mine", coeff = 1.0},
	{name = "phosphate-mine-02", coeff = 1.0},
}

data.raw["mining-drill"]["oil-derrick-mk01"].energy_usage = "150kW"

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
end

local function get_base_tech(name)
	if (ends_with(name, "mk02") or ends_with(name, "mk03") or ends_with(name, "mk04") or ends_with(name, "mk05")) then
		local baseEntity = name:sub(0, #name - 5)
		--log("Base entity of " .. name .. " is " .. baseEntity)
		return baseEntity
	end
	
	return nil
end

local function get_energy_usage(str)
	if ends_with(str, "kW") then
		local trimmedStr = str:sub(0, #str - 2)
		return tonumber(trimmedStr)
	end
	if ends_with(str, "MW") then
		local trimmedStr = str:sub(0, #str - 2)
		return tonumber(trimmedStr) * 1000
	end
	if ends_with(str, "W") then
		local trimmedStr = str:sub(0, #str - 1)
		return tonumber(trimmedStr) / 1000
	end
end

for k,v in pairs(drills) do

	local drill = data.raw["mining-drill"][v.name]

	local name = drill.name
	local baseTech = get_base_tech(name)
	local miningPowerCoeff = math.pow(drill.mining_power or 1, 0.55) -- logarithmic growth
	local miningSpeedCoeff = math.pow(drill.mining_speed, 0.70) -- logarithmic growth, just a little bit steeper
	
	if baseTech == nil then	
		drill["energy_source"].emissions_per_minute = math.floor(v.coeff * miningSpeedCoeff * pollutionCoefficient * miningPowerCoeff)
	else
		local baseEntity = data.raw["mining-drill"][baseTech]
		
		if baseEntity == nil then
			baseTech = baseTech .. "-mk01"
			baseEntity = data.raw["mining-drill"][baseTech]
		end
		
		local baseMiningSpeed = baseEntity.mining_speed
		--local baseMiningPower = baseEntity.mining_power or 1
		local basePowerUsage = get_energy_usage(baseEntity.energy_usage)
		local vPowerUsage = get_energy_usage(drill.energy_usage)
		drill["energy_source"].emissions_per_minute = math.floor(v.coeff * (baseMiningSpeed * pollutionCoefficient * miningPowerCoeff) * (vPowerUsage / basePowerUsage))
	end
end

--Debug
-- for k,v in pairs(data.raw["mining-drill"]) do
	-- local power = v.mining_power or 1
	-- log("[" .. v.name .. "]" .. ": Energy: " .. v.energy_usage .. "; Pollution: " .. v.energy_source.emissions_per_minute .. "; MiningSpeed: " .. v.mining_speed .. "; Mining Power: " .. power)
-- end
