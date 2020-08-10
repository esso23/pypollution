local function CreateAdvancedSolarPanel(solarPanelPrototype)
	local advancedSolarPanelPrototype = table.deepcopy(solarPanelPrototype)
	advancedSolarPanelPrototype.name = "solar-panel-advanced"
	advancedSolarPanelPrototype.minable.result = "solar-panel-advanced"
	advancedSolarPanelPrototype.production = "70kW"

	data:extend({advancedSolarPanelPrototype})
	
	local advancedSolarPanelItem = table.deepcopy(data.raw.item["solar-panel"])
	advancedSolarPanelItem.name = "solar-panel-advanced"
	advancedSolarPanelItem.place_result = "solar-panel-advanced"
	
	data:extend({advancedSolarPanelItem})
	
	local advancedSolarPanelRecipe = table.deepcopy(data.raw.recipe["solar-panel"])
	advancedSolarPanelRecipe.name = "solar-panel-advanced"
	advancedSolarPanelRecipe.energy_required = 120
	advancedSolarPanelRecipe.ingredients =
	{
		{type = "item", name = "solar-panel", amount = 1},
		{type = "item", name = "boron", amount = 2},
		{type = "item", name = "stainless-steel", amount = 4},
		{type = "item", name = "advanced-circuit", amount = 10},
		{type = "item", name = "small-parts-02", amount = 10},
	}
	advancedSolarPanelRecipe.result = "solar-panel-advanced"
	advancedSolarPanelRecipe.enabled = "false"
	
	data:extend({advancedSolarPanelRecipe})
	RECIPE("solar-panel-advanced"):add_unlock("solar-energy")
end

if not settings.startup["pypollution-enable-realistic-solar-panel"] or settings.startup["pypollution-enable-realistic-solar-panel"].value == false then
	RECIPE("solar-panel"):set_fields {energy_required = 60}
	RECIPE("solar-panel"):remove_ingredient("copper-plate"):add_ingredient({type = "item", name = "copper-plate", amount = 12})
	RECIPE("solar-panel"):remove_ingredient("steel-plate"):add_ingredient({type = "item", name = "steel-plate", amount = 20})
	RECIPE("solar-panel"):remove_ingredient("pyrite"):add_ingredient({type = "item", name = "pyrite", amount = 10})
else
	-- http://www.madehow.com/Volume-1/Solar-Cell.html
	-- https://en.wikipedia.org/wiki/Solar_panel
	-- https://en.wikipedia.org/wiki/Solar_tracker
	RECIPE("solar-panel"):set_fields {energy_required = 60}
	RemoveAllRecipeIngredients("solar-panel")
	
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "light-n", amount = 10})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "tinned-cable", amount = 15})
	-- RECIPE("solar-panel"):add_ingredient({type = "fluid", name = "nitrogen", amount = 50})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "aluminium-plate", amount = 10})
	-- RECIPE("solar-panel"):add_ingredient({type = "item", name = "silicon", amount = 5})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "plastic-bar", amount = 5})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "glass", amount = 8})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "steel-plate", amount = 10})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "silver-plate", amount = 5})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "electronic-circuit", amount = 5})
	
	local solarPanelPrototype = data.raw["solar-panel"]["solar-panel"]
	solarPanelPrototype.production = "40kW"
	solarPanelPrototype.next_upgrade = "solar-panel-advanced"
	solarPanelPrototype.fast_replaceable_group = "solar-panel"
	
	CreateAdvancedSolarPanel(solarPanelPrototype)
end
