local gasVent = data.raw["furnace"]["py-gas-vent"]
if gasVent then
	gasVent.energy_source.emissions_per_minute = 20
end

local sinkHole = data.raw["furnace"]["py-sinkhole"]
if sinkHole then
	sinkHole.energy_source.emissions_per_minute = 20
end

local function SetVoidRecipe(name, energy, emissions)
	local recipe = data.raw.recipe[name]
	if not recipe then
		log("Recipe "..name.." not found")
		return
	end
	
	if energy then
		recipe.energy = energy
	end
	
	if emissions then
		recipe.emissions_multiplier = emissions
	end
end

SetVoidRecipe("pure-natural-gas-pyvoid-gas", nil, "0.5")
SetVoidRecipe("purified-natural-gas-pyvoid-gas", nil, "0.5")
SetVoidRecipe("refined-natural-gas-pyvoid-gas", nil, "0.5")
SetVoidRecipe("pressured-air-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("pressured-hydrogen-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("pressured-steam-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("pressured-water-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("purified-air-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("vacuum-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("water-saline-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("blood-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("hot-air-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("hydrogen-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("liquid-pure-air-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("liquid-pure-air-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("oxygen-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("nitrogen-pyvoid-gas", "0.0", "0.0")
SetVoidRecipe("pressured-water-pyvoid-fluid", "0.0", "0.0")
SetVoidRecipe("pressured-water-pyvoid-fluid", "0.0", "0.0")
SetVoidRecipe("ralesia-extract-pyvoid-fluid", nil, "0.0")
SetVoidRecipe("raw-ralesia-extract-pyvoid-fluid", nil, "0.0")
SetVoidRecipe("water-pyvoid-fluid", "0.0", "0.0")
SetVoidRecipe("water-saline-pyvoid-fluid", "0.0", "0.0")
SetVoidRecipe("blood-pyvoid-fluid", nil, "0.0")
SetVoidRecipe("liquid-pure-air-pyvoid-fluid", "0.0", "0.0")
SetVoidRecipe("methanol-pyvoid-fluid", nil, "0.5")
