-- Combustion Turbines

data.raw["generator"]["gasturbinemk01"]["energy_source"].emissions_per_minute = math.floor(335.79)
data.raw["generator"]["gasturbinemk01"].maximum_temperature = 750
data.raw["generator"]["gasturbinemk01"].fluid_usage_per_tick = 0.5 -- Default: 1
data.raw["generator"]["gasturbinemk01"].effectivity = 0.84 -- Default: 0.42

data.raw["generator"]["gasturbinemk02"]["energy_source"].emissions_per_minute = math.floor(539.09)
data.raw["generator"]["gasturbinemk02"].maximum_temperature = 900
data.raw["generator"]["gasturbinemk02"].fluid_usage_per_tick = 1 -- Default: 1
data.raw["generator"]["gasturbinemk02"].effectivity = 0.95 -- Default: 0.95

data.raw["generator"]["gasturbinemk03"]["energy_source"].emissions_per_minute = math.floor(750)
data.raw["generator"]["gasturbinemk03"].maximum_temperature = 1000
data.raw["generator"]["gasturbinemk03"].fluid_usage_per_tick = 2 -- Default: 1.5
data.raw["generator"]["gasturbinemk03"].effectivity = 1.1 -- Default: 1.47

-- Combustion Mixture recipes balancing

SetRecipeResultAmount("coalgas-combustion", "combustion-mixture1", 100);     -- Default: 150
SetRecipeResultAmount("coalgas-combustion-biomass", "combustion-mixture1", 100);     -- Default: 150

SetRecipeResultAmount("coalslurry-combustion", "combustion-mixture1", 100);  -- Default: 150
SetRecipeResultAmount("coalslurry-combustion-biomass", "combustion-mixture1", 100);  -- Default: 150

SetRecipeResultAmount("tall-oil-combustion", "combustion-mixture1", 200);    -- Default: 150
SetRecipeResultAmount("tall-oil-combustion-biomass", "combustion-mixture1", 200);    -- Default: 150

SetRecipeResultAmount("hydrogen-combustion", "combustion-mixture1", 40);     -- Default: 150
SetRecipeResultAmount("hydrogen-combustion-biomass", "combustion-mixture1", 40);     -- Default: 150

SetRecipeResultAmount("syngas-combustion", "combustion-mixture1", 125);      -- Default: 150
SetRecipeResultAmount("syngas-combustion-biomass", "combustion-mixture1", 125);      -- Default: 150

SetRecipeResultAmount("gasoline-combustion", "combustion-mixture1", 200);    -- Default: 150
SetRecipeResultAmount("gasoline-combustion-biomass", "combustion-mixture1", 200);    -- Default: 150

SetRecipeResultAmount("diborane-combustion", "combustion-mixture1", 120);	 -- Default: 150
SetRecipeResultAmount("diborane-combustion-biomass", "combustion-mixture1", 120);	 -- Default: 150

SetRecipeResultAmount("fuelrodmk02-combustion", "combustion-mixture1", 180); -- Default: 300
SetRecipeResultAmount("fuelrodmk04-combustion", "combustion-mixture1", 550); -- Default: 300
SetRecipeResultAmount("fuelrodmk05-combustion", "combustion-mixture1", 650); -- Default: 300

--SetRecipeResultAmount("xxxxxxx", "combustion-mixture1", xxxx);               -- Default: xxxxxx

data.raw.recipe["hydrogen-combustion"].energy_required = 1 -- Default: 3
data.raw.recipe["fuelrodmk04-combustion"].energy_required = 5 -- Default: 3
data.raw.recipe["fuelrodmk05-combustion"].energy_required = 6 -- Default: 3
