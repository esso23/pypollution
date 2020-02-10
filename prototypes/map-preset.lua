data.raw["map-gen-presets"]["default"]["pyanodon-default"] = 
{
	basic_settings =
	{
		starting_area = 1.33,
	},
    advanced_settings =
	{
      enemy_evolution =
	  {
        pollution_factor = 3e-07,
        time_factor = 5e-07,
		destroy_factor = 75e-05
      },
      pollution =
	  {
        ageing = 1.0,
        enemy_attack_pollution_consumption_modifier = 1.0
      }
    },
    order = "a"
}

data.raw["map-gen-presets"]["default"]["pyanodon-easy"] = 
{
	basic_settings =
	{
		starting_area = 1.33,
	},
    advanced_settings =
	{
      enemy_evolution =
	  {
        pollution_factor = 2e-07,
        time_factor = 0,
		destroy_factor = 50e-05
      },
      pollution =
	  {
        ageing = 1.0,
        enemy_attack_pollution_consumption_modifier = 1.0
      }
    },
    order = "a"
}

data.raw["map-gen-presets"]["default"]["pyanodon-hard"] = 
{
	basic_settings =
	{
		starting_area = 1.33,
	},
    advanced_settings =
	{
      enemy_evolution =
	  {
        pollution_factor = 4e-07,
        time_factor = 10e-07,
		destroy_factor = 100e-05
      },
      pollution =
	  {
        ageing = 1.0,
        enemy_attack_pollution_consumption_modifier = 1.0
      }
    },
    order = "a"
}

data.raw["map-gen-presets"]["default"]["pyanodon-rail-world"] =
{
    advanced_settings =
	{
      enemy_evolution =
	  {
        pollution_factor = 3e-07,
        time_factor = 3e-07,
		destroy_factor = 100e-05
      },
      enemy_expansion =
	  {
        enabled = false
      }
    },
    basic_settings =
	{
      autoplace_controls =
	  {
        coal =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
        ["copper-ore"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
        ["crude-oil"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
        ["enemy-base"] =
		{
          size = 1
        },
        ["iron-ore"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
        stone =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
        ["uranium-ore"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["niobium"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["borax"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["molybdenum-ore"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["regolites"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["volcanic-pipe"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["rare-earth-bolide"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["phosphate-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-quartz"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-tin"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-lead"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-aluminium"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["salt-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["quartz-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["nickel-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["nexelit-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["lead-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["iron-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["copper-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["coal-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["chromium-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["aluminium-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["zinc-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["uranium-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["titanium-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["tin-rock"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["raw-coal"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-tin"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-quartz"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-nickel"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-lead"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-chromium"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-aluminium"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-zinc"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["ore-titanium"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["phosphate-rock-02"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["tar-patch"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["oil-mk01"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["oil-mk02"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["oil-mk03"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["oil-mk04"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["sulfur-patch"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        },
		["oil-sand"] =
		{
          frequency = 0.33333333332999997,
          size = 3
        }
      },
      property_expression_names = {},
      terrain_segmentation = 0.5,
      water = 1.5,
	  starting_area = 1.5
    },
    order = "e"
}

-- log(serpent.block(data.raw["map-gen-presets"]["default"]))
