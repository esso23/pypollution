if not settings.startup["pypollution-enable-realistic-solar-panel"] or settings.startup["pypollution-enable-realistic-solar-panel"].value == false then
	RECIPE("solar-panel"):set_fields {energy_required = 60}
	RECIPE("solar-panel"):remove_ingredient("copper-plate"):add_ingredient({type = "item", name = "copper-plate", amount = 12})
	RECIPE("solar-panel"):remove_ingredient("steel-plate"):add_ingredient({type = "item", name = "steel-plate", amount = 20})
	RECIPE("solar-panel"):remove_ingredient("pyrite"):add_ingredient({type = "item", name = "pyrite", amount = 10})
else
	-- http://www.madehow.com/Volume-1/Solar-Cell.html
	-- https://en.wikipedia.org/wiki/Solar_panel
	-- https://en.wikipedia.org/wiki/Solar_tracker
	-- https://www.azom.com/article.aspx?ArticleID=12014
	RECIPE("solar-panel"):set_fields {energy_required = 60}
	RemoveAllRecipeIngredients("solar-panel")
	
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "light-n", amount = 10})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "tinned-cable", amount = 20})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "aluminium-plate", amount = 10})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "plastic-bar", amount = 8})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "glass", amount = 8})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "stainless-steel", amount = 10})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "silver-plate", amount = 5})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "electronic-circuit", amount = 10})
	RECIPE("solar-panel"):add_ingredient({type = "item", name = "boron", amount = 2})
end
