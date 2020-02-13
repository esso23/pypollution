local function SetFluidFuelData(name, emissions, fuelValue)
	local fuel = data.raw.fluid[name]
	
	if not fuel then
		log("Liquid fuel "..name.." not found.")
		return
	end
	
	if emissions then
		fuel.emissions_multiplier = emissions
	end
	
	if fuelValue then
		fuel.fuel_value = fuelValue
	end
end

local function SetSolidFuelData(name, emissions, fuelValue)
	local fuel = data.raw.item[name]
	
	if not fuel then
		log("Solid fuel "..name.." not found.")
		return
	end
	
	if emissions then
		fuel.fuel_emissions_multiplier = emissions
	end
	
	if fuelValue then
		fuel.fuel_value = fuelValue
	end
end

-- Unprocessed fuels cause more pollution (incentive for processing)
SetSolidFuelData("coal", "1.05", nil)
SetSolidFuelData("raw-coal", "1.2", nil)
SetSolidFuelData("coal-dust", "1.2", nil)
SetSolidFuelData("crushed-coal", "1.2", nil)
SetFluidFuelData("crude-oil", "1.5", nil)
SetFluidFuelData("tar", "1.5", nil)

-- Coke is polluting less than coal, it already generates a lot of pollution during processing anyway
SetSolidFuelData("coke", "0.85", nil)


-- Let's make FuelRods worth the investment
-- Wee need to consider the pollution generated when mining and processing uranium and also when mining and processing other required ores
local fuelRodMk1 = data.raw.item["fuelrod-mk01"]
if fuelRodMk1 then
	fuelRodMk1.fuel_emissions_multiplier = "0.75"
	fuelRodMk1.fuel_acceleration_multiplier = "1.1"
	fuelRodMk1.fuel_top_speed_multiplier = "1.05"
end

local fuelRodMk2 = data.raw.item["fuelrod-mk02"]
if fuelRodMk2 then
	fuelRodMk2.fuel_emissions_multiplier = "0.65"
	--fuelRodMk2.fuel_acceleration_multiplier = "1.2"
	--fuelRodMk2.fuel_top_speed_multiplier = "1.2"
end

local fuelRodMk3 = data.raw.item["fuelrod-mk03"]
if fuelRodMk3 then
	fuelRodMk3.fuel_emissions_multiplier = "0.53"
	--fuelRodMk3.fuel_acceleration_multiplier = "1.5"
	--fuelRodMk3.fuel_top_speed_multiplier = "1.2"
end

local fuelRodMk4 = data.raw.item["fuelrod-mk04"]
if fuelRodMk4 then
	fuelRodMk4.fuel_emissions_multiplier = "0.40"
	--fuelRodMk4.fuel_acceleration_multiplier = "2.0"
	--fuelRodMk4.fuel_top_speed_multiplier = "1.2"
end

local fuelRodMk5 = data.raw.item["fuelrod-mk05"]
if fuelRodMk5 then
	fuelRodMk5.fuel_emissions_multiplier = "0.25"
	--fuelRodMk5.fuel_acceleration_multiplier = "2.3999999999999999"
	--fuelRodMk5.fuel_top_speed_multiplier = "1.2"
end


-- Burning wood produces more pollution than coal
-- https://www.climateinteractive.org/media-coverage/new-york-times-op-ed-burning-wood-is-worse-than-coal-for-the-climate/
SetSolidFuelData("wood", "1.25", nil)
SetSolidFuelData("log", "1.25", nil)
SetSolidFuelData("treated-wood", "1.35", nil) -- It's treated with chemicals! Why would you even do this anyway?
SetSolidFuelData("fiberboard", "1.5", nil)
SetSolidFuelData("formica", "1.6", nil)
SetSolidFuelData("raw-fiber", "1.35", nil)
SetSolidFuelData("fiber", "1.35", nil)


-- Hydrogen has low pollution but needs to be expensive to get (real hydrogen is more expensive to get than the energy it provides)

-- Its energy density is between 120 and 142 MJ/kg
-- https://hypertextbook.com/facts/2005/MichelleFung.shtml

-- A 100% efficient electrolyser requires 39 kWh of electricity to produce 1 kg of hydrogen. The devices today require as much as 48 kWh/kg.
-- http://www.renewableenergyfocus.com/view/3157/hydrogen-production-from-renewables/

-- So it takes 172 MJ to produce 1 kg of Hydrogen with fuel value of ~140 MJ.

-- Electrolyzer MK01 consumes 827 kWh (2977 MJ) to produce 180 000 Hydrogen (in 1 hour) (200 per 4 seconds)
-- TL;DR You need more energy to produce the hydrogen than it provides - usable as "accumulator" since it causes no pollution
SetFluidFuelData("hydrogen", "0.0", "0.015MJ")

-- 500 hydrogen + 600 water + 5 gasoline = 50 pressured hydrogen + 600 Steam (60°C)
SetFluidFuelData("pressured-hydrogen", "0.0", "0.16MJ")


-- "Natural gas emits 50 to 60 percent less carbon dioxide (CO2) when combusted in a new, efficient natural gas power plant compared with emissions from a typical new coal plant [1]."
-- https://www.ucsusa.org/resources/environmental-impacts-natural-gas

SetFluidFuelData("natural-gas", "0.8", "1.0MJ") -- 1MJ
SetFluidFuelData("raw-gas", "0.60", "0.5MJ") -- 0.2MJ
SetFluidFuelData("refined-natural-gas", "0.50", "0.6MJ")-- 0.3MJ
SetFluidFuelData("purified-natural-gas", "0.35", "0.8MJ")-- 0.4MJ
SetFluidFuelData("pure-natural-gas", "0.25", "1.0MJ")-- 0.5MJ


-- The main constituents are, by volume, about 50% hydrogen, 30% methane and 3% higher hydrocarbons, 7% carbon monoxide, 3% carbon dioxide and 7% nitrogen.
-- http://www.thermopedia.com/content/641/
SetFluidFuelData("coke-oven-gas", "0.85", nil)


-- Raw Bitumen is not used as fuel
-- TODO: https://en.wikipedia.org/wiki/Bitumen-based_fuel
-- Remove Bitumen fuel value and add recipe for bitumen fuel (Bitumen + Water + Phenol) or (Bitumen + Water + Some Alcohol (Ethylene?))
local bitumen = data.raw.fluid["bitumen"]
if bitumen then
	bitumen.fuel_value = "0J"
	bitumen.fuel_category = ""
end


-- Syngas, however, has less than half the energy density of natural gas. - this is ok, no fixes
SetFluidFuelData("syngas", "0.9", nil)
SetFluidFuelData("refsyngas", "0.8", nil)


-- Gasoline has lower energy value, but less pollution than diesel
SetFluidFuelData("gasoline", "0.9", nil)

SetFluidFuelData("benzene", nil, "0.8MJ")
SetFluidFuelData("ethylene", "0.95", "1MJ")

SetFluidFuelData("methane", nil, "0.4MJ") -- "0.8MJ" - This is way too easy to get

SetFluidFuelData("propene", "0.90", "1MJ")

--Debug
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
