function SetRecipeResultAmount(recipe, result, newAmount)
  local results = data.raw.recipe[recipe].results
  for _,v in pairs(results) do
    if (v.name == result) then
	  v.amount = newAmount
	  --log("Setting amount to " .. newAmount .. " on recipe's " .. recipe .. " result " .. result)
	end
  end
end