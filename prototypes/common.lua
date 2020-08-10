function SetRecipeResultAmount(recipeName, result, newAmount)
	local recipe = data.raw.recipe[recipeName]
	
	if not recipe then
		log(recipeName .. " not found.")
		return
	end

	local results = recipe.results
	for _,v in pairs(results) do
		if (v.name == result) then
			v.amount = newAmount
			--log("Setting amount to " .. newAmount .. " on recipe's " .. recipeName .. " result " .. result)
		end
	end
end

function RemoveAllRecipeIngredients(recipeName)
	local recipe = data.raw.recipe[recipeName]
	
	if not recipe then
		log(recipeName .. " not found.")
		return
	end
	
	recipe.ingredients = {}
end
