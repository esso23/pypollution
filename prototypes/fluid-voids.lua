data.raw["furnace"]["py-sinkhole"].energy_source.emissions_per_minute = 20

data.raw.recipe["pressured-water-pyvoid-fluid"].energy = "0.0"
data.raw.recipe["pressured-water-pyvoid-fluid"].emissions_multiplier = "0.0"

data.raw.recipe["ralesia-extract-pyvoid-fluid"].emissions_multiplier = "0.0"

data.raw.recipe["raw-ralesia-extract-pyvoid-fluid"].emissions_multiplier = "0.0"

data.raw.recipe["water-pyvoid-fluid"].energy = "0.0"
data.raw.recipe["water-pyvoid-fluid"].emissions_multiplier = "0.0"

data.raw.recipe["water-saline-pyvoid-fluid"].energy = "0.0"
data.raw.recipe["water-saline-pyvoid-fluid"].emissions_multiplier = "0.0"

data.raw.recipe["blood-pyvoid-fluid"].emissions_multiplier = "0.0"

data.raw.recipe["liquid-pure-air-pyvoid-fluid"].energy = "0.0"
data.raw.recipe["liquid-pure-air-pyvoid-fluid"].emissions_multiplier = "0.0"

-- Methanol
-- Any methanol that unavoidably escapes into the environment will have little long-term impact, and with sufficient dilution will rapidly biodegrade with little to no environmental damage due to toxicity.
-- https://en.wikipedia.org/wiki/Methanol
data.raw.recipe["methanol-pyvoid-fluid"].emissions_multiplier = "0.5"
