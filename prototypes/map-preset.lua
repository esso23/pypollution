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
        ageing = 1.25,
        enemy_attack_pollution_consumption_modifier = 1.25
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
        ageing = 1.5,
        enemy_attack_pollution_consumption_modifier = 1.5
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

if mods["pyalienlife"] then
	data.raw["map-gen-presets"]["default"]["pyanodon-easy"]["advanced_settings"]["enemy_evolution"].pollution_factor = 1e-07
	
	data.raw["map-gen-presets"]["default"]["pyanodon-default"]["advanced_settings"]["enemy_evolution"].time_factor = 4e-07
	data.raw["map-gen-presets"]["default"]["pyanodon-default"]["advanced_settings"]["enemy_evolution"].pollution_factor = 2e-07
	
	data.raw["map-gen-presets"]["default"]["pyanodon-hard"]["advanced_settings"]["enemy_evolution"].time_factor = 8e-07
	data.raw["map-gen-presets"]["default"]["pyanodon-hard"]["advanced_settings"]["enemy_evolution"].pollution_factor = 3e-07
end

-- log(serpent.block(data.raw["map-gen-presets"]["default"]))
