local baseCoefficient = 10

local assemblers = 
{
	{name = "distilator", coeff = 2.0},	-- Destructive Distillation Column
	{name = "gasifier", coeff = 1.0},
	{name = "carbon-filter", coeff = 0.4},
	{name = "tar-processing-unit", coeff = 1.2},
	{name = "rectisol", coeff = 1.0},
	{name = "methanol-reactor", coeff = 1.2},
	{name = "quenching-tower", coeff = 1.5},
	{name = "hpf", coeff = 0.7},	-- High-Pressure Furnace
	{name = "power-house", coeff = 0.9},
	{name = "cooling-tower", coeff = 0.1},
	{name = "evaporator", coeff = 0.6},
	{name = "desulfurizator-unit", coeff = 1.2},
	{name = "olefin-plant", coeff = 1.6},
	{name = "soil-extractor", coeff = 1.5},	-- mk01 without a DASH!
	{name = "ground-borer", coeff = 2.0},
	{name = "fts-reactor", coeff = 1.0},
	{name = "solid-separator", coeff = 0.5},
	{name = "washer", coeff = 0.5},
	{name = "classifier", coeff = 0.5},
	{name = "advanced-foundry", coeff = 1.3},
	{name = "fluid-separator", coeff = 0.8},
	{name = "fawogae-plantation", coeff = -0.5},
	{name = "ulric-corral", coeff = -1.0},
	{name = "ralesia-plantation", coeff = -1.5},
	{name = "jaw-crusher", coeff = 0.8},
	{name = "ball-mill", coeff = 0.8},
	{name = "mukmoux-pasture", coeff = -1.0},
	{name = "automated-factory", coeff = 1.2},	--- 3x times Assembler-mk01 which is 4/m
	{name = "sand-extractor", coeff = 1.5},
	{name = "botanical-nursery", coeff = -1.0},
	{name = "wpu", coeff = 0.8},	-- Wood Processing Unit
	{name = "agitator", coeff = 0.7},
	{name = "thickener", coeff = 1.0},
	{name = "vacuum-pump", coeff = 0.2},
	{name = "plankton-farm", coeff = -1.0},
	{name = "xyhiphoe-pool", coeff = -1.2},
	{name = "hydrocyclone", coeff = 0.6},
	{name = "mixer", coeff = 0.6},
	{name = "automated-screener", coeff = 0.6},
	{name = "secondary-crusher", coeff = 0.6},
	{name = "centrifugal-pan", coeff = 1.0},
	{name = "jig", coeff = 1.5},
	{name = "grease-table", coeff = 1.0},
	{name = "compressor", coeff = 0.2},
	{name = "genlab", coeff = 0.8},
	{name = "kmauts-enclosure", coeff = 0.2},
	{name = "bio-reactor", coeff = 0.6},
	{name = "gas-separator", coeff = 1.3},	-- Gas Processing Unit
	{name = "nmf", coeff = 1.1},	-- Nano-Material Factory
	{name = "fusion-reactor", coeff = 1.5},
	{name = "py-heat-exchanger", coeff = 0.0},
	{name = "auog-paddock", coeff = -0.2},
	{name = "kicalk-plantation", coeff = -1.0},
	{name = "zipir", coeff = -3.0},
	{name = "clay-pit", coeff = 1.5},
	{name = "moondrop-greenhouse", coeff = -1.0},
	{name = "fbreactor", coeff = 0.8},
	{name = "electronics-factory", coeff = 0.5},
	{name = "pulp-mill", coeff = 0.4},
	{name = "pcb-factory", coeff = 0.5},
	{name = "chipshooter", coeff = 0.5},
	{name = "nano-assembler", coeff = 1.1},
	{name = "cadaveric-arum", coeff = -0.4},
	{name = "quantum-computer", coeff = 1.0},
	{name = "particle-accelerator", coeff = 1.0},
	{name = "scrubber", coeff = 0.7},
	{name = "flotation-cell", coeff = 0.7},
	{name = "wet-scrubber", coeff = 0.7},
	{name = "hydroclassifier", coeff = 0.7},
	{name = "impact-crusher", coeff = 0.6},
	{name = "electrolyzer", coeff = 0.4},
	{name = "casting-unit", coeff = 0.8},
	{name = "leaching-station", coeff = 1.0},
	{name = "bof", coeff = 2.0},	-- Basic Oxygen Furnace
	{name = "eaf", coeff = 1.2},	-- Electric Arc Furnace
	{name = "sinter-unit", coeff = 1.0},	-- Sinter Unit
	{name = "drp", coeff = 2.0},	-- Direct Reduction Plant
	{name = "heavy-oil-refinery", coeff = 2.0},
	{name = "upgrader", coeff = 2.0},	-- Ionic Upgrader
	{name = "cracker", coeff = 3.0},	-- Multi-Purpose Cracker
	{name = "reformer", coeff = 2.0},
	{name = "rhe", coeff = 0.15},	-- Regenerative Heat Exchanger
	{name = "tholin-atm", coeff = 1.0},
	{name = "pumpjack", coeff = 1.0},
	{name = "tholin-plant", coeff = 1.0},
	{name = "lor", coeff = 2.0},	-- Light Oil Refinery
	{name = "coalbed", coeff = 2.0},	-- Coalbed Extractor
	{name = "gas-refinery", coeff = 2.0},
	{name = "guar-gum-plantation", coeff = -1.5},
	{name = "fracking-rig", coeff = 10.0},
	{name = "retorter", coeff = 4.0},
	{name = "pumpjack-hightech", coeff = 1.0},
}

local function ends_with(str, ending)
   return ending == "" or str:sub(-#ending) == ending
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

local function init_mk(baseEntity, mkIndex, name, coeff)
	local mkEntity = data.raw["assembling-machine"][name .. "-mk0" .. mkIndex]
	
	if not mkEntity then
		mkEntity = data.raw["assembling-machine"][name .. "mk0" .. mkIndex]
	end
	
	if not mkEntity then
		--log("MK0"..mkIndex.." not found for "..name)
		return
	end
	
	-- Positive pollution values are the same on all MK ranks
	-- if (coeff >= 0) then
		-- mkEntity.energy_source.emissions_per_minute = baseEntity.energy_source.emissions_per_minute
		-- return
	-- end
	
	local basePowerUsage = get_energy_usage(baseEntity.energy_usage)
	local mkPowerUsage = get_energy_usage(mkEntity.energy_usage)
	
	mkEntity.energy_source.emissions_per_minute = math.floor(baseEntity.energy_source.emissions_per_minute * ((mkPowerUsage - ((mkPowerUsage - basePowerUsage) / 2)) / basePowerUsage))
end

for k,v in pairs(assemblers) do
	local baseEntity = data.raw["assembling-machine"][v.name]
	
	if not baseEntity then
		baseEntity = data.raw["assembling-machine"][v.name .. "-mk01"]
	end
	if not baseEntity then
		baseEntity = data.raw["assembling-machine"][v.name .. "mk01"]
	end
	
	baseEntity.energy_source.emissions_per_minute = math.floor(baseCoefficient * v.coeff)
	
	init_mk(baseEntity, 2, v.name, v.coeff)
	init_mk(baseEntity, 3, v.name, v.coeff)
	init_mk(baseEntity, 4, v.name, v.coeff)
end

-- Debug
-- for k,v in pairs(data.raw["assembling-machine"]) do
	-- local emissions = tostring(v.energy_source.emissions_per_minute) or "--"
	-- --log("{name = \"" .. v.name .. "\", coeff = 1.0},")
	-- --log("data.raw[\"assembling-machine\"].[\"" .. v.name .. "\"].emissions_per_minute = " .. emissions)
	-- log("[" .. v.name .. "]" .. ": Energy: " .. v.energy_usage .. "; Pollution: " .. emissions)
-- end
