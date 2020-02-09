data.raw["map-gen-presets"]["default"]["pyanodon-default"] = 
{
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
    order = "p"
}

data.raw["map-gen-presets"]["default"]["pyanodon-easy"] = 
{
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
    order = "p"
}

data.raw["map-gen-presets"]["default"]["pyanodon-hard"] = 
{
    advanced_settings =
	{
      enemy_evolution =
	  {
        pollution_factor = 4e-07,
        time_factor = 15e-07,
		destroy_factor = 100e-05
      },
      pollution =
	  {
        ageing = 1.0,
        enemy_attack_pollution_consumption_modifier = 1.0
      }
    },
    order = "p"
}

-- log(serpent.block(data.raw["map-gen-presets"]["default"]))
