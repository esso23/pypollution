local baseCoefficient = 10

local assemblers = 
{
	-- Early game
	{name = "distilator", coeff = 0.8},	-- Destructive Distillation Column
	{name = "gasifier", coeff = 0.8},
	{name = "tar-processing-unit", coeff = 0.8},

	-- Miners
	{name = "ground-borer", coeff = 2.0},
	{name = "coalbed", coeff = 1.5},	-- Coalbed Extractor
	{name = "pumpjack", coeff = 1.0},
	{name = "pumpjack-hightech", coeff = 1.0},

	-- Resource "generators"
	{name = "soil-extractor", coeff = 1.0},	-- mk01 without a DASH!
	{name = "sand-extractor", coeff = 1.0},
	{name = "clay-pit", coeff = 1.0},
	{name = "tholin-atm", coeff = 1.0},
	{name = "tholin-plant", coeff = 1.0},
	
	-- Ore (pre-)processing
	{name = "solid-separator", coeff = 0.5},
	{name = "washer", coeff = 0.5},
	{name = "classifier", coeff = 0.5},
	{name = "fluid-separator", coeff = 0.5},
	{name = "jaw-crusher", coeff = 0.5},
	{name = "ball-mill", coeff = 0.5},
	{name = "hydrocyclone", coeff = 0.5},
	{name = "mixer", coeff = 0.5},
	{name = "automated-screener", coeff = 0.5},
	{name = "secondary-crusher", coeff = 0.5},
	{name = "centrifugal-pan", coeff = 0.5},
	{name = "flotation-cell", coeff = 0.5},
	{name = "wet-scrubber", coeff = 0.5},
	{name = "hydroclassifier", coeff = 0.5},
	{name = "impact-crusher", coeff = 0.5},
	{name = "leaching-station", coeff = 0.5},
	{name = "sinter-unit", coeff = 0.5},
	{name = "scrubber", coeff = 0.5},
	{name = "wpu", coeff = 0.5},	-- Wood Processing Unit
	{name = "grease-table", coeff = 0.5},
	{name = "thickener", coeff = 0.5},
	{name = "agitator", coeff = 0.5},
	
	-- Heavy Industry
	{name = "lor", coeff = 1.5},	-- Light Oil Refinery
	{name = "gas-refinery", coeff = 1.5},
	{name = "fracking-rig", coeff = 5.0},
	{name = "retorter", coeff = 3.0},
	{name = "drp", coeff = 1.5},	-- Direct Reduction Plant
	{name = "heavy-oil-refinery", coeff = 1.5},
	{name = "upgrader", coeff = 1.5},	-- Ionic Upgrader
	{name = "cracker", coeff = 1.5},	-- Multi-Purpose Cracker
	{name = "reformer", coeff = 1.5},
	{name = "quenching-tower", coeff = 1.5},
	{name = "olefin-plant", coeff = 1.5},
	{name = "jig", coeff = 1.5},
	
	-- Smelting/Crafting
	{name = "casting-unit", coeff = 0.8},
	{name = "bof", coeff = 2.0},	-- Basic Oxygen Furnace (burnable fuel)
	{name = "eaf", coeff = 1.0},	-- Electric Arc Furnace
	{name = "automated-factory", coeff = 1.2},	--- 3x times Assembler-mk01 which is 4/m
	{name = "advanced-foundry", coeff = 0.8},
	
	-- Electronics
	{name = "pcb-factory", coeff = 0.5},
	{name = "chipshooter", coeff = 0.5},
	{name = "nano-assembler", coeff = 1.0},
	{name = "fbreactor", coeff = 0.5},
	{name = "electronics-factory", coeff = 0.5},
	{name = "quantum-computer", coeff = 0.5},
	{name = "particle-accelerator", coeff = 1.0},
	{name = "nmf", coeff = 1.0},	-- Nano-Material Factory
	
	{name = "carbon-filter", coeff = 0.4},
	{name = "rectisol", coeff = 1.0},
	{name = "methanol-reactor", coeff = 1.0},
	{name = "hpf", coeff = 0.7},	-- High-Pressure Furnace
	{name = "power-house", coeff = 0.9},
	{name = "cooling-tower", coeff = 0.1},
	{name = "evaporator", coeff = 0.6},
	{name = "desulfurizator-unit", coeff = 1.0},
	{name = "fts-reactor", coeff = 1.0},
	{name = "vacuum-pump", coeff = 0.2},
	{name = "compressor", coeff = 0.2},
	{name = "genlab", coeff = 0.8},
	{name = "kmauts-enclosure", coeff = 0.2},
	{name = "bio-reactor", coeff = 0.5},
	{name = "gas-separator", coeff = 1.0},	-- Gas Processing Unit
	{name = "fusion-reactor", coeff = 1.5},
	{name = "py-heat-exchanger", coeff = 0.6},
	{name = "pulp-mill", coeff = 0.4},
	{name = "electrolyzer", coeff = 0.4},
	{name = "rhe", coeff = 0.1},	-- Regenerative Heat Exchanger
}

if mods["pyalienlife"] then
	table.insert(assemblers, { name = "atomizer", coeff = 0.4 })
	table.insert(assemblers, { name = "fwf", coeff = -2.0 })
	table.insert(assemblers, { name = "sap-extractor", coeff = -0.5 })
	table.insert(assemblers, { name = "moss-farm", coeff = -1.5 })
	table.insert(assemblers, { name = "seaweed-crop", coeff = -1.0 })
	table.insert(assemblers, { name = "slaughterhouse", coeff = 1.0 })
	table.insert(assemblers, { name = "fawogae-plantation", coeff = -1.5 })
	table.insert(assemblers, { name = "botanical-nursery", coeff = -2.0 })
	table.insert(assemblers, { name = "guar-gum-plantation", coeff = -2.0 })
	table.insert(assemblers, { name = "ralesia-plantation", coeff = -1.5 })
	table.insert(assemblers, { name = "moondrop-greenhouse", coeff = -2.0 })
else
	table.insert(assemblers, { name = "auog-paddock", coeff = -0.2 })
	table.insert(assemblers, { name = "ulric-corral", coeff = -1.0 })
	table.insert(assemblers, { name = "mukmoux-pasture", coeff = -1.0 })
	table.insert(assemblers, { name = "plankton-farm", coeff = -1.0 })
	table.insert(assemblers, { name = "xyhiphoe-pool", coeff = -1.2 })
	table.insert(assemblers, { name = "kicalk-plantation", coeff = -1.0 })
	table.insert(assemblers, { name = "zipir", coeff = -3.0 })
	table.insert(assemblers, { name = "moondrop-greenhouse", coeff = -1.0 })
	table.insert(assemblers, { name = "botanical-nursery", coeff = -1.0 })
	table.insert(assemblers, { name = "cadaveric-arum", coeff = -0.4 })
	table.insert(assemblers, { name = "guar-gum-plantation", coeff = -1.5 })
	table.insert(assemblers, { name = "fawogae-plantation", coeff = -1.0 })
	table.insert(assemblers, { name = "ralesia-plantation", coeff = -1.5 })
end

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
	
	-- There can be multiple mk01 entities (example: ulric-corral & ulric-corral-mk01

	local alternateBaseEntity = nil
	alternateBaseEntity = data.raw["assembling-machine"][v.name .. "-mk01"]
	if not alternateBaseEntity then
		alternateBaseEntity = data.raw["assembling-machine"][v.name .. "mk01"]
	end
	
	if not baseEntity then
		baseEntity = alternateBaseEntity
	else
		if alternateBaseEntity then
			-- In this case we have 2 base entities - we need to set emissions for both of them
			alternateBaseEntity.energy_source.emissions_per_minute = math.floor(baseCoefficient * v.coeff)
		end
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
