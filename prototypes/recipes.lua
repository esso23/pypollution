-- Pumpjack
data.raw.recipe["water-saline-pumpjack"].emissions_multiplier = 0.2
data.raw.recipe["water-free"].emissions_multiplier = 0.1

local function find_product_amount(recipe, product)
	for _,v in pairs(recipe.results) do
		if (v.name == product) then
			return v.amount
		end
	end
end

local function set_emissions_multiplier(recipeName, productName, baseEnergy, baseAmount)
	local recipe = data.raw.recipe[recipeName]
	local amountProduced = find_product_amount(recipe, productName)

	recipe.emissions_multiplier = (baseEnergy - ((baseEnergy - recipe.energy_required) / 2)) / recipe.energy_required

	local amountCoefficient = baseAmount / amountProduced
	if recipe.emissions_multiplier > 1.0 then
		recipe.emissions_multiplier = 1.0 + ((recipe.emissions_multiplier - 1) * amountCoefficient)
	end
	
	--log(recipeName.." ["..productName.."="..amountProduced.."] "..recipe.emissions_multiplier.."   ["..amountCoefficient.."]  ")
end

-- Botanical Nursery
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