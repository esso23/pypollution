require("__stdlib__/stdlib/data/data").Util.create_data_globals()

-- Pumpjack
local pumpjackSaline = data.raw.recipe["water-saline-pumpjack"]
if pumpjackSaline then
	pumpjackSaline.emissions_multiplier = 0.2
end

local pumpjackWater = data.raw.recipe["water-free"]
if pumpjackWater then
	pumpjackWater.emissions_multiplier = 0.1
end

local function find_product_amount(recipe, product)
	for _,v in pairs(recipe.results) do
		if (v.name == product) then
			return v.amount
		end
	end
end

local function set_emissions_multiplier(recipeName, productName, baseEnergy, baseAmount)
	local recipe = data.raw.recipe[recipeName]
	
	if recipe == nil then
		return
	end
	
	local amountProduced = find_product_amount(recipe, productName)
	
	if amountProduced == nil then
		return
	end

	recipe.emissions_multiplier = (baseEnergy - ((baseEnergy - recipe.energy_required) / 2)) / recipe.energy_required

	local amountCoefficient = baseAmount / amountProduced
	if recipe.emissions_multiplier > 1.0 then
		recipe.emissions_multiplier = 1.0 + ((recipe.emissions_multiplier - 1) * amountCoefficient)
	end
	
	--log(recipeName.." ["..productName.."="..amountProduced.."] "..recipe.emissions_multiplier.."   ["..amountCoefficient.."]  ")
end

if not mods["pyalienlife"] then
	-- Better recipes are absorbing more pollution

	-- Logs
	set_emissions_multiplier("log1", "log", 80, 3)
	set_emissions_multiplier("log2", "log", 80, 3)
	set_emissions_multiplier("log3", "log", 80, 3)
	set_emissions_multiplier("log4", "log", 80, 3)
	set_emissions_multiplier("log5", "log", 80, 3)
	set_emissions_multiplier("log6", "log", 80, 3)
	set_emissions_multiplier("log7", "log", 80, 3)
	set_emissions_multiplier("log8", "log", 80, 3)
	set_emissions_multiplier("log7-2", "log", 80, 3)

	-- Moondrop
	set_emissions_multiplier("methane", "methane", 20, 30)
	set_emissions_multiplier("methane-co2", "methane", 20, 30)
	set_emissions_multiplier("methane-py-fertilizer", "methane", 20, 30)

	-- Kicalk
	set_emissions_multiplier("raw-fiber", "raw-fiber", 180, 24)
	set_emissions_multiplier("raw-fiber2", "raw-fiber", 180, 24)
	set_emissions_multiplier("raw-fiber3", "raw-fiber", 180, 24)
	set_emissions_multiplier("raw-fiber4", "raw-fiber", 180, 24)

	-- Ulric
	set_emissions_multiplier("bonemeal", "bonemeal", 45, 5)
	set_emissions_multiplier("bonemeal-salt", "bonemeal", 45, 5)
	set_emissions_multiplier("bonemeal2", "bonemeal", 45, 5)
	set_emissions_multiplier("bonemeal4", "bonemeal", 45, 5)

	-- Mukmoux
	set_emissions_multiplier("mukmoux-fat", "mukmoux-fat", 60, 15)
	set_emissions_multiplier("mukmoux-fat-salt", "mukmoux-fat", 60, 15)
	set_emissions_multiplier("mukmoux-fat2", "mukmoux-fat", 60, 15)
	set_emissions_multiplier("mukmoux-fat3", "mukmoux-fat", 60, 15)

	-- Guar
	set_emissions_multiplier("guar-01", "guar", 80, 5)
	set_emissions_multiplier("guar-02", "guar", 80, 5)
	set_emissions_multiplier("guar-03", "guar", 80, 5)
	set_emissions_multiplier("guar-04", "guar", 80, 5)
	set_emissions_multiplier("guar-05", "guar", 80, 5)
end

-- Solar Panel balancing
RECIPE("solar-panel"):set_fields {energy_required = 60}
RECIPE("solar-panel"):remove_ingredient("copper-plate"):add_ingredient({type = "item", name = "copper-plate", amount = 12})
RECIPE("solar-panel"):remove_ingredient("steel-plate"):add_ingredient({type = "item", name = "steel-plate", amount = 20})
RECIPE("solar-panel"):remove_ingredient("pyrite"):add_ingredient({type = "item", name = "pyrite", amount = 10})

-- Coke -> CO2 vs Biomass -> CO2 balancing
RECIPE("coke-co2"):set_fields {energy_required = 2}
RECIPE("coke-co2"):remove_ingredient("coke"):add_ingredient({type = "item", name = "coke", amount = 5})
SetRecipeResultAmount("coke-co2", "carbon-dioxide", 200);
