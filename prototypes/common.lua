function SetRecipeResultAmount(recipe, result, newAmount)
	local recipe = data.raw.recipe[recipe]
	
	if recipe == nil then
		log(recipe .. " not found.")
		return
	end

	local results = recipe.results
	for _,v in pairs(results) do
		if (v.name == result) then
			v.amount = newAmount
			--log("Setting amount to " .. newAmount .. " on recipe's " .. recipe .. " result " .. result)
		end
	end
end
