-- Unprocessed fuels cause more pollution (incentive for processing)
data.raw.item["coal"].fuel_emissions_multiplier = "1.05"
data.raw.item["raw-coal"].fuel_emissions_multiplier = "1.2"
data.raw.item["coal-dust"].fuel_emissions_multiplier = "1.2"
data.raw.item["crushed-coal"].fuel_emissions_multiplier = "1.2"
data.raw.fluid["crude-oil"].emissions_multiplier = "1.5"
data.raw.fluid["tar"].emissions_multiplier = "1.5"

-- Coke is polluting less than coal, it already generates a lot of pollution during processing anyway
data.raw.item["coke"].fuel_emissions_multiplier = "0.85"


-- Let's make FuelRods worth the investment
-- Wee need to consider the pollution generated when mining and processing uranium and also when mining and processing other required ores
data.raw.item["fuelrod-mk01"].fuel_emissions_multiplier = "0.75"
data.raw.item["fuelrod-mk01"].fuel_acceleration_multiplier = "1.1"
data.raw.item["fuelrod-mk01"].fuel_top_speed_multiplier = "1.05"

data.raw.item["fuelrod-mk02"].fuel_emissions_multiplier = "0.70"
--data.raw.item["fuelrod-mk02"].fuel_acceleration_multiplier = "1.2"
--data.raw.item["fuelrod-mk02"].fuel_top_speed_multiplier = "1.2"

data.raw.item["fuelrod-mk03"].fuel_emissions_multiplier = "0.64"
--data.raw.item["fuelrod-mk03"].fuel_acceleration_multiplier = "1.5"
--data.raw.item["fuelrod-mk03"].fuel_top_speed_multiplier = "1.2"

data.raw.item["fuelrod-mk04"].fuel_emissions_multiplier = "0.57"
--data.raw.item["fuelrod-mk04"].fuel_acceleration_multiplier = "2.0"
--data.raw.item["fuelrod-mk04"].fuel_top_speed_multiplier = "1.2"

data.raw.item["fuelrod-mk05"].fuel_emissions_multiplier = "0.49"
--data.raw.item["fuelrod-mk05"].fuel_acceleration_multiplier = "2.3999999999999999"
--data.raw.item["fuelrod-mk05"].fuel_top_speed_multiplier = "1.2"


-- Burning wood produces more pollution than coal
-- https://www.climateinteractive.org/media-coverage/new-york-times-op-ed-burning-wood-is-worse-than-coal-for-the-climate/
data.raw.item["wood"].fuel_emissions_multiplier = "1.25"
data.raw.item["log"].fuel_emissions_multiplier = "1.25"
data.raw.item["treated-wood"].fuel_emissions_multiplier = "1.35" -- It's treated with chemicals! Why would you even do this anyway?
data.raw.item["fiberboard"].fuel_emissions_multiplier = "1.5"
data.raw.item["formica"].fuel_emissions_multiplier = "1.6"
data.raw.item["raw-fiber"].fuel_emissions_multiplier = "1.35"
data.raw.item["fiber"].fuel_emissions_multiplier = "1.35"


-- Hydrogen has low pollution but needs to be expensive to get (real hydrogen is more expensive to get than the energy it provides)

-- Its energy density is between 120 and 142 MJ/kg
-- https://hypertextbook.com/facts/2005/MichelleFung.shtml

-- A 100% efficient electrolyser requires 39 kWh of electricity to produce 1 kg of hydrogen. The devices today require as much as 48 kWh/kg.
-- http://www.renewableenergyfocus.com/view/3157/hydrogen-production-from-renewables/

-- So it takes 172 MJ to produce 1 kg of Hydrogen with fuel value of ~140 MJ.

-- Electrolyzer MK01 consumes 827 kWh (2977 MJ) to produce 180 000 Hydrogen (in 1 hour) (200 per 4 seconds)
-- TL;DR You need more energy to produce the hydrogen than it provides - usable as "accumulator" since it causes no pollution
data.raw.fluid["hydrogen"].fuel_value = "0.015MJ"
data.raw.fluid["hydrogen"].emissions_multiplier = "0.0"

-- 500 hydrogen + 600 water + 5 gasoline = 50 pressured hydrogen + 600 Steam (60°C)
data.raw.fluid["pressured-hydrogen"].fuel_value = "0.16MJ"
data.raw.fluid["pressured-hydrogen"].emissions_multiplier = "0.0"


-- "Natural gas emits 50 to 60 percent less carbon dioxide (CO2) when combusted in a new, efficient natural gas power plant compared with emissions from a typical new coal plant [1]."
-- https://www.ucsusa.org/resources/environmental-impacts-natural-gas

data.raw.fluid["natural-gas"].emissions_multiplier = "0.8"
data.raw.fluid["natural-gas"].fuel_value = "0.5MJ" -- "1MJ"
data.raw.fluid["raw-gas"].emissions_multiplier = "0.9"
data.raw.fluid["refined-natural-gas"].emissions_multiplier = "0.85"
data.raw.fluid["purified-natural-gas"].emissions_multiplier = "0.8"
data.raw.fluid["pure-natural-gas"].emissions_multiplier = "0.7"


-- The main constituents are, by volume, about 50% hydrogen, 30% methane and 3% higher hydrocarbons, 7% carbon monoxide, 3% carbon dioxide and 7% nitrogen.
-- http://www.thermopedia.com/content/641/
data.raw.fluid["coke-oven-gas"].emissions_multiplier = "0.85"


-- Raw Bitumen is not used as fuel
-- TODO: https://en.wikipedia.org/wiki/Bitumen-based_fuel
-- Remove Bitumen fuel value and add recipe for bitumen fuel (Bitumen + Water + Phenol) or (Bitumen + Water + Some Alcohol (Ethylene?))
data.raw.fluid["bitumen"].fuel_value = "0J"
data.raw.fluid["bitumen"].fuel_category = ""


-- Syngas, however, has less than half the energy density of natural gas. - this is ok, no fixes
data.raw.fluid["syngas"].emissions_multiplier = "0.9"
data.raw.fluid["refsyngas"].emissions_multiplier = "0.8"


-- Gasoline has lower energy value, but less pollution than diesel
data.raw.fluid["gasoline"].emissions_multiplier = "0.9"


data.raw.fluid["benzene"].fuel_value = "0.8MJ"
data.raw.fluid["ethylene"].emissions_multiplier = "0.95"
data.raw.fluid["ethylene"].fuel_value = "1MJ"
data.raw.fluid["methane"].fuel_value = "0.4MJ" -- "0.8MJ" - This is way too easy to get
data.raw.fluid["propene"].emissions_multiplier = "0.90"
data.raw.fluid["propene"].fuel_value = "1MJ"

-- Debug
-- for _,v in pairs(data.raw.item) do
	-- if v.fuel_value then
		-- local emissions = (v.fuel_emissions_multiplier or 1) * 100
		-- log("[Solid] "..v.name.." - "..v.fuel_value.."; Emissions: "..emissions.."%")
	-- end
-- end
-- for _,v in pairs(data.raw.fluid) do
	-- if v.fuel_value then
		-- local emissions = v.emissions_multiplier or 1
		-- log("[Fluid] "..v.name.." - "..v.fuel_value.."; Emissions: "..emissions.."%")
	-- end
-- end
