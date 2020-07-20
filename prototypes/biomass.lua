local function set_recipe_ingredient_cost(recipeName, coeff)
	local recipe = data.raw.recipe[recipeName]
	
	if recipe == nil then
		log(recipeName .. " not found int set_recipe_ingredient_cost.")
		return
	end
	
	for _,v in pairs(recipe.ingredients) do
		if v.name then
			v.amount = math.floor(v.amount * coeff)
			if v.amount < 1 then
				v.amount = 1
			end
		else
			v[2] = math.floor(v[2] * coeff)
			if v[2] < 1 then
				v[2] = 1
			end
		end
	end
end

if mods["pyalienlife"] then
	set_recipe_ingredient_cost("compost-plant-mk01", 0.50)
	set_recipe_ingredient_cost("compost-plant-mk02", 0.50)
	set_recipe_ingredient_cost("compost-plant-mk03", 0.50)
	set_recipe_ingredient_cost("compost-plant-mk04", 0.50)
end

local function update_biomass_recipe(recipeName, energy, ingredientName, ingredientCount, resultName, resultCount)
	local recipe = data.raw.recipe[recipeName]
	-- local message;
	-- local changed = false;
	
	if recipe == nil then
		log(recipeName .. " not found.")
		return
	end
	
	-- message = recipeName
	
	if energy then
		recipe.energy_required = energy
	end
	
	if ingredientCount and ingredientName then
		for _,v in pairs(recipe.ingredients) do
			if (v.name == ingredientName) then
				-- local amountBefore = v.amount
				v.amount = ingredientCount
				-- if ingredientCount ~= amountBefore then
					-- changed = true;
					-- message = message .. " - ingredient " .. v.name .. " amount changed to " .. ingredientCount .. " (from " .. amountBefore .. ")"
				-- end
			end
		end
	end
	
	if resultCount and resultName then
		for _,v in pairs(recipe.results) do
			if (v.name == resultName) then
				-- local amountBefore = v.amount
				v.amount = resultCount
				-- if resultCount ~= amountBefore then
					-- changed = true;
					-- message = message .. " - product " .. v.name .. " amount changed to " .. resultCount .. " (from " .. amountBefore .. ")"
				-- end
			end
		end
	end
	
	-- if changed then
		-- log(message)
	-- end
end

-- Energy fix for Biomass recipes
for _,v in pairs(data.raw.recipe) do
	if (v.subgroup == "py-alienlife-compost") then
		v.energy_required = 10
	end
end

-- Biomass recipes
if mods["pyalienlife"] then
	-- ----------------------------------------------------------------------
    -- Game starters
	-- ----------------------------------------------------------------------
	update_biomass_recipe("biomass-wood", nil, "wood", nil, "biomass", 15) -- 3 wood 5 30
	update_biomass_recipe("biomass-log", nil, "log", nil, "biomass", 15) -- 3 log 1 30
	update_biomass_recipe("biomass-moss", nil, "moss", 10, "biomass", 20) -- 3 moss 3 13
	update_biomass_recipe("biomass-wood-seedling", nil, "wood-seedling", nil, "biomass", nil) -- 3 wood-seedling 10 10
	update_biomass_recipe("biomass-wood-seeds", nil, "wood-seeds", nil, "biomass", 15) -- 3 wood-seeds 4 30
	update_biomass_recipe("biomass-seaweed", nil, "seaweed", nil, "biomass", 15) -- 3 seaweed 10 20
	update_biomass_recipe("biomass-saps", nil, "saps", nil, "biomass", 10) -- 3 saps 10 23
	update_biomass_recipe("biomass-sap-tree", nil, "sap-tree", nil, "biomass", nil) -- 3 sap-tree 1 15
	update_biomass_recipe("biomass-sap-seeds", nil, "sap-seeds", nil, "biomass", nil) -- 3 sap-seeds 1 5
	update_biomass_recipe("biomass-creamy-latex", nil, "creamy-latex", nil, "biomass", 15) -- 3 creamy-latex 200 21
	update_biomass_recipe("biomass-agar", nil, "agar", 10, "biomass", 13) -- 3 agar 1 3
	update_biomass_recipe("biomass-cellulose", nil, "cellulose", nil, "biomass", nil) -- 3 cellulose 1 4
	
	-- ----------------------------------------------------------------------
	-- Complex plants
	-- ----------------------------------------------------------------------
	-- TIER 1 - 1:3 ratio
	-- Ralesia - Tier 1
	update_biomass_recipe("biomass-ralesia", nil, "ralesias", 10, "biomass", 30) -- 3 ralesias 10 20
	update_biomass_recipe("biomass-ralesia-seeds", nil, "ralesia-seeds", 8, "biomass", 15) -- 3 ralesia-seeds 3 4
	
	-- Kicalk - Tier 1
	update_biomass_recipe("biomass-kicalk", nil, "kicalk", 10, "biomass", 30) -- 3 kicalk 4 280
	update_biomass_recipe("biomass-kicalk-seeds", nil, "kicalk-seeds", 10, "biomass", 12) -- 3 kicalk-seeds 10 280
	
	-- Moondrop - Tier 1
	update_biomass_recipe("biomass-moondrop", nil, "moondrop", 10, "biomass", 30) -- 3 moondrop 5 35
	update_biomass_recipe("biomass-moondrop-seeds", nil, "moondrop-seeds", 10, "biomass", 10) -- 3 moondrop-seeds 5 12

	-- Phytoplankton - Tier 2 - LIQUID (exception)
	update_biomass_recipe("biomass-phytoplankton", nil, "phytoplankton", 50, "biomass", 20) -- 3 phytoplankton 50 45
	
	-- Tuuphra - Tier 1 (Science Tier 2)
	update_biomass_recipe("biomass-tuuphra", nil, "tuuphra", 10, "biomass", 30) -- 3 tuuphra 1 5
	update_biomass_recipe("biomass-tuuphra-seeds", nil, "tuuphra-seeds", 8, "biomass", 6) -- 3 tuuphra-seeds 10 15
	
	-- Rennea - Tier 1 (Science Tier 3)
	update_biomass_recipe("biomass-rennea", nil, "rennea", 10, "biomass", 30) -- 3 rennea 5 10
	update_biomass_recipe("biomass-rennea-seeds", nil, "rennea-seeds", 7, "biomass", 12) -- 3 rennea-seeds 10 45
	
	-- Yotoi Fruit - Tier 1 (Science Tier 2)
	update_biomass_recipe("biomass-yotoi-fruit", nil, "yotoi-fruit", 10, "biomass", 30) -- 3 yotoi-fruit 1 3
	
	-- Yotoi - Tier 2 (Science Tier 2)
	update_biomass_recipe("biomass-yotoi", nil, "yotoi", 10, "biomass", 40) -- 3 yotoi 1 15
	update_biomass_recipe("biomass-yotoi-seeds", nil, "yotoi-seeds", 10, "biomass", 40) -- 3 yotoi-seeds 10 10
	update_biomass_recipe("biomass-yotoi-leaves", nil, "yotoi-leaves", 10, "biomass", 16) -- 3 yotoi-leaves 1 2
	
	-- Cadaveric Arum - Tier 2 (Science Tier 2)
	update_biomass_recipe("biomass-cadaveric-arum", nil, "cadaveric-arum", 10, "biomass", 40) -- 3 cadaveric-arum 1 5
	update_biomass_recipe("biomass-cadaveric-arum-seeds", nil, "cadaveric-arum-seeds", 10, "biomass", 40) -- 3 cadaveric-arum-seeds 10 25
	
	-- Grods - Tier 1 (Science Tier 2)
	update_biomass_recipe("biomass-grod", nil, "grod", nil, "biomass", nil) -- 3 grod 3 15
	update_biomass_recipe("biomass-grod-seeds", nil, "grod-seeds", nil, "biomass", nil) -- 3 grod-seeds 10 25
	
	-- Fawogae - Tier 1
	update_biomass_recipe("biomass-fawogae", nil, "fawogae", 10, "biomass", 30) -- 3 fawogae 20 60
	update_biomass_recipe("biomass-fawogae-spore", nil, "fawogae-spore", nil, "biomass", nil) -- 3 fawogae-spore 10 10
	
	-- Yaedols - Tier 1 (Science Tier 2)
	update_biomass_recipe("biomass-yaedols", nil, "yaedols", 10, "biomass", 30) -- 3 yaedols 1 10
	update_biomass_recipe("biomass-yaedols-spores", nil, "yaedols-spores", nil, "biomass", nil) -- 3 yaedols-spores 10 10
	
	-- Navens - Tier 1 (Science Tier 4)
	update_biomass_recipe("biomass-navens", nil, "navens", 10, "biomass", 30) -- 3 navens 1 10
	update_biomass_recipe("biomass-navens-spore", nil, "navens-spore", nil, "biomass", nil) -- 3 navens-spore 10 10
	
	-- Cridren - Tier ???
	update_biomass_recipe("biomass-adrenal-cortex", nil, "adrenal-cortex", nil, "biomass", nil) -- 3 adrenal-cortex 1 1
	update_biomass_recipe("biomass-cridren-seeds", nil, "cridren-seeds", nil, "biomass", nil) -- 3 cridren-seeds 1 1
	update_biomass_recipe("biomass-cridren", nil, "cridren", 10, "biomass", 100) -- 3 cridren 1 40
	
	-- Guar
	update_biomass_recipe("biomass-guar", nil, "guar", nil, "biomass", nil) -- 3 guar 12 16
	update_biomass_recipe("biomass-guar-gum", nil, "guar-gum", nil, "biomass", nil) -- 3 guar-gum 10 10
	update_biomass_recipe("biomass-guar-seeds", nil, "guar-seeds", nil, "biomass", nil) -- 3 guar-seeds 100 8
	
	-- Bhoddos - Tier 1 (Science Tier 2)
	update_biomass_recipe("biomass-bhoddos", nil, "bhoddos", 10, "biomass", 30) -- 3 bhoddos 1 5
	update_biomass_recipe("biomass-bhoddos-spore", nil, "bhoddos-spore", nil, "biomass", nil) -- 3 bhoddos-spore 10 10
	
	-- ----------------------------------------------------------------------
	-- Animals
	-- ----------------------------------------------------------------------
	
	update_biomass_recipe("biomass-urea", nil, "urea", 10, "biomass", 10) -- 3 urea 1 1
	update_biomass_recipe("biomass-cocoon", nil, "cocoon", 10, "biomass", 20) -- 3 cocoon 1 1 (Vrauk Cocoon)
	update_biomass_recipe("biomass-bonemeal", nil, "bonemeal", 10, "biomass", 30) -- 3 bonemeal 1 3
	update_biomass_recipe("biomass-bones", nil, "bones", 10, "biomass", 10) -- 3 bones 1 3
	update_biomass_recipe("biomass-brain", nil, "brain", 10, "biomass", 20) -- 3 brain 1 3
	update_biomass_recipe("biomass-carapace", nil, "carapace", 10, "biomass", 50) -- 3 carapace 1 5
	update_biomass_recipe("biomass-guts", nil, "guts", 10, "biomass", 30) -- 3 guts 1 3
	update_biomass_recipe("biomass-lignin", nil, "lignin", nil, "biomass", nil) -- 3 lignin 1 12
	update_biomass_recipe("biomass-meat", nil, "meat", nil, "biomass", nil) -- 3 meat 1 3
	update_biomass_recipe("biomass-mukmoux-fat", nil, "mukmoux-fat", 10, "biomass", 30) -- 3 mukmoux-fat 1 3 (Lard)
	update_biomass_recipe("biomass-skin", nil, "skin", nil, "biomass", nil) -- 3 skin 1 3
	update_biomass_recipe("biomass-collagen", nil, "collagen", nil, "biomass", nil) -- 3 collagen 1 5
	update_biomass_recipe("biomass-blood-meal", nil, "blood-meal", nil, "biomass", nil) -- 3 blood-meal 1 2
	update_biomass_recipe("biomass-blood", nil, "blood", nil, "biomass", nil) -- 3 blood 10 5
	
	-- Auog - Tier 1
	update_biomass_recipe("biomass-blood-caged-auog", nil, "blood-caged-auog", nil, "biomass", 20) -- 3 blood-caged-auog 1 30
	update_biomass_recipe("biomass-bone-caged-auog", nil, "bone-caged-auog", nil, "biomass", 20) -- 3 bone-caged-auog 1 30
	update_biomass_recipe("biomass-brain-caged-auog", nil, "brain-caged-auog", nil, "biomass", 20) -- 3 brain-caged-auog 1 30
	update_biomass_recipe("biomass-fat-caged-auog", nil, "fat-caged-auog", nil, "biomass", 20) -- 3 fat-caged-auog 1 30
	update_biomass_recipe("biomass-guts-caged-auog", nil, "guts-caged-auog", nil, "biomass", 20) -- 3 guts-caged-auog 1 30
	update_biomass_recipe("biomass-meat-caged-auog", nil, "meat-caged-auog", nil, "biomass", 20) -- 3 meat-caged-auog 1 30
	update_biomass_recipe("biomass-skin-caged-auog", nil, "skin-caged-auog", nil, "biomass", 20) -- 3 skin-caged-auog 1 30
	update_biomass_recipe("biomass-caged-auog", nil, "caged-auog", nil, "biomass", 20) -- 3 caged-auog 1 20
	update_biomass_recipe("biomass-auog", nil, "auog", nil, "biomass", 20) -- 3 auog 1 20
	update_biomass_recipe("biomass-auog-pup", nil, "auog-pup", nil, "biomass", 10) -- 3 auog-pup 1 15
	
	-- Ulric - Tier 1 (Science Tier 2)
	update_biomass_recipe("biomass-ulric", nil, "ulric", nil, "biomass", 20) -- 3 ulric 1 8
	update_biomass_recipe("biomass-blood-caged-ulric", nil, "blood-caged-ulric", nil, "biomass", 20) -- 3 blood-caged-ulric 1 20
	update_biomass_recipe("biomass-bone-caged-ulric", nil, "bone-caged-ulric", nil, "biomass", 20) -- 3 bone-caged-ulric 1 20
	update_biomass_recipe("biomass-brain-caged-ulric", nil, "brain-caged-ulric", nil, "biomass", 20) -- 3 brain-caged-ulric 1 20
	update_biomass_recipe("biomass-fat-caged-ulric", nil, "fat-caged-ulric", nil, "biomass", 20) -- 3 fat-caged-ulric 1 20
	update_biomass_recipe("biomass-guts-caged-ulric", nil, "guts-caged-ulric", nil, "biomass", 20) -- 3 guts-caged-ulric 1 20
	update_biomass_recipe("biomass-meat-caged-ulric", nil, "meat-caged-ulric", nil, "biomass", 20) -- 3 meat-caged-ulric 1 20
	update_biomass_recipe("biomass-skin-caged-ulric", nil, "skin-caged-ulric", nil, "biomass", 20) -- 3 skin-caged-ulric 1 20
	
	-- Mukmoux - Tier 2 (Science Tier 2)
	update_biomass_recipe("biomass-mukmoux", nil, "mukmoux", nil, "biomass", nil) -- 3 mukmoux 1 25
	update_biomass_recipe("biomass-caged-mukmoux", nil, "caged-mukmoux", nil, "biomass", 25) -- 3 caged-mukmoux 1 20
	update_biomass_recipe("biomass-blood-caged-mukmoux", nil, "blood-caged-mukmoux", nil, "biomass", 30) -- 3 blood-caged-mukmoux 1 25
	update_biomass_recipe("biomass-bone-caged-mukmoux", nil, "bone-caged-mukmoux", nil, "biomass", 30) -- 3 bone-caged-mukmoux 1 25
	update_biomass_recipe("biomass-brain-caged-mukmoux", nil, "brain-caged-mukmoux", nil, "biomass", 30) -- 3 brain-caged-mukmoux 1 25
	update_biomass_recipe("biomass-fat-caged-mukmoux", nil, "fat-caged-mukmoux", nil, "biomass", 30) -- 3 fat-caged-mukmoux 1 25
	update_biomass_recipe("biomass-guts-caged-mukmoux", nil, "guts-caged-mukmoux", nil, "biomass", 30) -- 3 guts-caged-mukmoux 1 25
	update_biomass_recipe("biomass-meat-caged-mukmoux", nil, "meat-caged-mukmoux", nil, "biomass", 30) -- 3 meat-caged-mukmoux 1 25
	update_biomass_recipe("biomass-skin-caged-mukmoux", nil, "skin-caged-mukmoux", nil, "biomass", 30) -- 3 skin-caged-mukmoux 1 25
	update_biomass_recipe("biomass-mukmoux-calf", nil, "mukmoux-calf", nil, "biomass", nil) -- 3 mukmoux-calf 1 10
	
	-- Vrauk - Tier 2
	update_biomass_recipe("biomass-vrauks", nil, "vrauks", nil, "biomass", 25) -- 3 vrauks 1 8
	update_biomass_recipe("biomass-blood-caged-vrauks", nil, "blood-caged-vrauks", nil, "biomass", 30) -- 3 blood-caged-vrauks 1 20
	update_biomass_recipe("biomass-brain-caged-vrauks", nil, "brain-caged-vrauks", nil, "biomass", 30) -- 3 brain-caged-vrauks 1 20
	update_biomass_recipe("biomass-caged-vrauks", nil, "caged-vrauks", nil, "biomass", 30) -- 3 caged-vrauks 1 20
	update_biomass_recipe("biomass-chitin-caged-vrauks", nil, "chitin-caged-vrauks", nil, "biomass", 30) -- 3 chitin-caged-vrauks 1 20
	update_biomass_recipe("biomass-guts-caged-vrauks", nil, "guts-caged-vrauks", nil, "biomass", 30) -- 3 guts-caged-vrauks 1 20
	update_biomass_recipe("biomass-meat-caged-vrauks", nil, "meat-caged-vrauks", nil, "biomass", 30) -- 3 meat-caged-vrauks 1 20
	
	-- Arthurian - Tier 3 (Science Tier 4)
	update_biomass_recipe("biomass-caged-arthurian", nil, "caged-arthurian", nil, "biomass", 30) -- 3 caged-arthurian 1 20
	update_biomass_recipe("biomass-arthurian", nil, "arthurian", nil, "biomass", 30) -- 3 arthurian 1 10
	update_biomass_recipe("biomass-blood-caged-arthurian", nil, "blood-caged-arthurian", nil, "biomass", 40) -- 3 blood-caged-arthurian 1 20
	update_biomass_recipe("biomass-bone-caged-arthurian", nil, "bone-caged-arthurian", nil, "biomass", 40) -- 3 bone-caged-arthurian 1 20
	update_biomass_recipe("biomass-brain-caged-arthurian", nil, "brain-caged-arthurian", nil, "biomass", 40) -- 3 brain-caged-arthurian 1 20
	update_biomass_recipe("biomass-fat-caged-arthurian", nil, "fat-caged-arthurian", nil, "biomass", 40) -- 3 fat-caged-arthurian 1 20
	update_biomass_recipe("biomass-guts-caged-arthurian", nil, "guts-caged-arthurian", nil, "biomass", 40) -- 3 guts-caged-arthurian 1 20
	update_biomass_recipe("biomass-meat-caged-arthurian", nil, "meat-caged-arthurian", nil, "biomass", 40) -- 3 meat-caged-arthurian 1 20
	update_biomass_recipe("biomass-skin-caged-arthurian", nil, "skin-caged-arthurian", nil, "biomass", 40) -- 3 skin-caged-arthurian 1 20
	update_biomass_recipe("biomass-arthurian-egg", nil, "arthurian-egg", nil, "biomass", nil) -- 3 arthurian-egg 1 5
	update_biomass_recipe("biomass-arthurian-pup", nil, "arthurian-pup", nil, "biomass", 15) -- 3 arthurian-pup 1 10
	
	-- Dhilmos - Tier 3 (Science Tier 3)
	update_biomass_recipe("biomass-dhilmos", nil, "dhilmos", nil, "biomass", 30) -- 3 dhilmos 1 15
	update_biomass_recipe("biomass-blood-dhilmos", nil, "blood-dhilmos", nil, "biomass", 40) -- 3 blood-dhilmos 1 20
	update_biomass_recipe("biomass-fat-dhilmos", nil, "fat-dhilmos", nil, "biomass", 40) -- 3 fat-dhilmos 1 20
	update_biomass_recipe("biomass-guts-dhilmos", nil, "guts-dhilmos", nil, "biomass", 40) -- 3 guts-dhilmos 1 20
	update_biomass_recipe("biomass-meat-dhilmos", nil, "meat-dhilmos", nil, "biomass", 40) -- 3 meat-dhilmos 1 20
	update_biomass_recipe("biomass-dhilmos-pup", nil, "dhilmos-pup", nil, "biomass", 40) -- 3 dhilmos-pup 1 10
	update_biomass_recipe("biomass-dhilmos-egg", nil, "dhilmos-egg", nil, "biomass", 40) -- 3 dhilmos-egg 1 5
	
	-- Scrondrix - Tier 3 (Science Tier 3)
	update_biomass_recipe("biomass-caged-scrondrix", nil, "caged-scrondrix", nil, "biomass", 30) -- 3 caged-scrondrix 1 25
	update_biomass_recipe("biomass-scrondrix", nil, "scrondrix", nil, "biomass", 30) -- 3 scrondrix 1 20
	update_biomass_recipe("biomass-blood-caged-scrondrix", nil, "blood-caged-scrondrix", nil, "biomass", 40) -- 3 blood-caged-scrondrix 1 25
	update_biomass_recipe("biomass-bone-caged-scrondrix", nil, "bone-caged-scrondrix", nil, "biomass", 40) -- 3 bone-caged-scrondrix 1 25
	update_biomass_recipe("biomass-brain-caged-scrondrix", nil, "brain-caged-scrondrix", nil, "biomass", 40) -- 3 brain-caged-scrondrix 1 25
	update_biomass_recipe("biomass-fat-caged-scrondrix", nil, "fat-caged-scrondrix", nil, "biomass", 40) -- 3 fat-caged-scrondrix 1 25
	update_biomass_recipe("biomass-guts-caged-scrondrix", nil, "guts-caged-scrondrix", nil, "biomass", 40) -- 3 guts-caged-scrondrix 1 25
	update_biomass_recipe("biomass-meat-caged-scrondrix", nil, "meat-caged-scrondrix", nil, "biomass", 40) -- 3 meat-caged-scrondrix 1 25
	update_biomass_recipe("biomass-skin-caged-scrondrix", nil, "skin-caged-scrondrix", nil, "biomass", 40) -- 3 skin-caged-scrondrix 1 25	
	update_biomass_recipe("biomass-scrondrix-pup", nil, "scrondrix-pup", nil, "biomass", nil) -- 3 scrondrix-pup 1 15
	
	-- Phadai - Tier 2 (Science Tier 3)
	update_biomass_recipe("biomass-phadai", nil, "phadai", nil, "biomass", 25) -- 3 phadai 1 10
	update_biomass_recipe("biomass-caged-phadai", nil, "caged-phadai", nil, "biomass", 25) -- 3 caged-phadai 1 20
	update_biomass_recipe("biomass-blood-caged-phadai", nil, "blood-caged-phadai", nil, "biomass", 30) -- 3 blood-caged-phadai 1 20
	update_biomass_recipe("biomass-bone-caged-phadai", nil, "bone-caged-phadai", nil, "biomass", 30) -- 3 bone-caged-phadai 1 20
	update_biomass_recipe("biomass-brain-caged-phadai", nil, "brain-caged-phadai", nil, "biomass", 30) -- 3 brain-caged-phadai 1 20
	update_biomass_recipe("biomass-fat-caged-phadai", nil, "fat-caged-phadai", nil, "biomass", 30) -- 3 fat-caged-phadai 1 20
	update_biomass_recipe("biomass-guts-caged-phadai", nil, "guts-caged-phadai", nil, "biomass", 30) -- 3 guts-caged-phadai 1 20
	update_biomass_recipe("biomass-meat-caged-phadai", nil, "meat-caged-phadai", nil, "biomass", 30) -- 3 meat-caged-phadai 1 20
	update_biomass_recipe("biomass-skin-caged-phadai", nil, "skin-caged-phadai", nil, "biomass", 30) -- 3 skin-caged-phadai 1 20
	update_biomass_recipe("biomass-phadai-pup", nil, "phadai-pup", nil, "biomass", 12) -- 3 phadai-pup 1 15
	
	-- Dingrit - Tier 3 (Science Tier 3)
	update_biomass_recipe("biomass-dingrits", nil, "dingrits", nil, "biomass", 30) -- 3 dingrits 1 20
	update_biomass_recipe("biomass-caged-dingrits", nil, "caged-dingrits", nil, "biomass", 30) -- 3 caged-dingrits 1 15
	update_biomass_recipe("biomass-blood-caged-dingrits", nil, "blood-caged-dingrits", nil, "biomass", 40) -- 3 blood-caged-dingrits 1 15
	update_biomass_recipe("biomass-bone-caged-dingrits", nil, "bone-caged-dingrits", nil, "biomass", 40) -- 3 bone-caged-dingrits 1 15
	update_biomass_recipe("biomass-brain-caged-dingrits", nil, "brain-caged-dingrits", nil, "biomass", 40) -- 3 brain-caged-dingrits 1 15
	update_biomass_recipe("biomass-fat-caged-dingrits", nil, "fat-caged-dingrits", nil, "biomass", 40) -- 3 fat-caged-dingrits 1 15
	update_biomass_recipe("biomass-guts-caged-dingrits", nil, "guts-caged-dingrits", nil, "biomass", 40) -- 3 guts-caged-dingrits 1 15
	update_biomass_recipe("biomass-meat-caged-dingrits", nil, "meat-caged-dingrits", nil, "biomass", 40) -- 3 meat-caged-dingrits 1 15
	update_biomass_recipe("biomass-charged-dingrit", nil, "charged-dingrit", nil, "biomass", nil) -- 3 charged-dingrit 1 20
	update_biomass_recipe("biomass-dingrits-cub", nil, "dingrits-cub", nil, "biomass", 15) -- 3 dingrits-cub 1 10
	update_biomass_recipe("biomass-dingrit-spike", nil, "dingrit-spike", nil, "biomass", nil) -- 3 dingrit-spike 1 3
	update_biomass_recipe("biomass-used-dingrit", nil, "used-dingrit", nil, "biomass", nil) -- 3 used-dingrit 1 8
	update_biomass_recipe("biomass-fur", nil, "fur", nil, "biomass", nil) -- 3 fur 1 3
	update_biomass_recipe("biomass-pelt", nil, "pelt", nil, "biomass", nil) -- 3 pelt 1 4
	
	-- Kmaut - Tier 2 (Science Tier 2)
	update_biomass_recipe("biomass-kmauts", nil, "kmauts", nil, "biomass", 25) -- 3 kmauts 1 10
	update_biomass_recipe("biomass-caged-kmauts", nil, "caged-kmauts", nil, "biomass", 25) -- 3 caged-kmauts 1 20
	update_biomass_recipe("biomass-blood-caged-kmauts", nil, "blood-caged-kmauts", nil, "biomass", 30) -- 3 blood-caged-kmauts 1 20
	update_biomass_recipe("biomass-brain-caged-kmauts", nil, "brain-caged-kmauts", nil, "biomass", 30) -- 3 brain-caged-kmauts 1 20
	update_biomass_recipe("biomass-fat-caged-kmauts", nil, "fat-caged-kmauts", nil, "biomass", 30) -- 3 fat-caged-kmauts 1 20
	update_biomass_recipe("biomass-guts-caged-kmauts", nil, "guts-caged-kmauts", nil, "biomass", 30) -- 3 guts-caged-kmauts 1 20
	update_biomass_recipe("biomass-meat-caged-kmauts", nil, "meat-caged-kmauts", nil, "biomass", 30) -- 3 meat-caged-kmauts 1 20
	update_biomass_recipe("biomass-kmauts-cub", nil, "kmauts-cub", nil, "biomass", 12) -- 3 kmauts-cub 1 10
	update_biomass_recipe("biomass-serine", nil, "serine", 10, "biomass", 10) -- 3 serine 1 5
	update_biomass_recipe("biomass-tendon", nil, "tendon", 10, "biomass", 10) -- 3 tendon 1 5
	
	-- Vonix - Tier 4 (Science Tier 4)
	update_biomass_recipe("biomass-vonix", nil, "vonix", nil, "biomass", 40) -- 3 vonix 1 40
	update_biomass_recipe("biomass-blood-vonix", nil, "blood-vonix", nil, "biomass", 50) -- 3 blood-vonix 1 30
	update_biomass_recipe("biomass-brain-vonix", nil, "brain-vonix", nil, "biomass", 50) -- 3 brain-vonix 1 30
	update_biomass_recipe("biomass-fat-vonix", nil, "fat-vonix", nil, "biomass", 50) -- 3 fat-vonix 1 30
	update_biomass_recipe("biomass-guts-vonix", nil, "guts-vonix", nil, "biomass", 50) -- 3 guts-vonix 1 30
	update_biomass_recipe("biomass-meat-vonix", nil, "meat-vonix", nil, "biomass", 50) -- 3 meat-vonix 1 30
	update_biomass_recipe("biomass-skin-vonix", nil, "skin-vonix", nil, "biomass", 50) -- 3 skin-vonix 1 30
	update_biomass_recipe("biomass-venon-gland", nil, "venon-gland", nil, "biomass", nil) -- 3 venon-gland 1 2
	update_biomass_recipe("biomass-vonix-cub", nil, "vonix-cub", nil, "biomass", 20) -- 3 vonix-cub 1 15
	update_biomass_recipe("biomass-vonix-eggs", nil, "vonix-eggs", nil, "biomass", nil) -- 3 vonix-eggs 1 5
	
	-- Phagnot - Tier 3 (Science Tier 2)
	update_biomass_recipe("biomass-phagnot", nil, "phagnot", nil, "biomass", 30) -- 3 phagnot 1 12
	update_biomass_recipe("biomass-caged-phagnot", nil, "caged-phagnot", nil, "biomass", 30) -- 3 caged-phagnot 1 15
	update_biomass_recipe("biomass-blood-caged-phagnot", nil, "blood-caged-phagnot", nil, "biomass", 40) -- 3 blood-caged-phagnot 1 15
	update_biomass_recipe("biomass-bone-caged-phagnot", nil, "bone-caged-phagnot", nil, "biomass", 40) -- 3 bone-caged-phagnot 1 15
	update_biomass_recipe("biomass-brain-caged-phagnot", nil, "brain-caged-phagnot", nil, "biomass", 40) -- 3 brain-caged-phagnot 1 15
	update_biomass_recipe("biomass-guts-caged-phagnot", nil, "guts-caged-phagnot", nil, "biomass", 40) -- 3 guts-caged-phagnot 1 15
	update_biomass_recipe("biomass-meat-caged-phagnot", nil, "meat-caged-phagnot", nil, "biomass", 40) -- 3 meat-caged-phagnot 1 15
	update_biomass_recipe("biomass-skin-caged-phagnot", nil, "skin-caged-phagnot", nil, "biomass", 40) -- 3 skin-caged-phagnot 1 15
	update_biomass_recipe("biomass-gas-bladder", nil, "gas-bladder", nil, "biomass", nil) -- 3 gas-bladder 1 3
	
	-- Xeno - Tier 4 (Science Tier 4)
	update_biomass_recipe("biomass-xeno", nil, "xeno", nil, "biomass", 40) -- 3 xeno 1 10
	update_biomass_recipe("biomass-bone-xeno", nil, "bone-xeno", nil, "biomass", 50) -- 3 bone-xeno 1 20
	update_biomass_recipe("biomass-brain-xeno", nil, "brain-xeno", nil, "biomass", 50) -- 3 brain-xeno 1 20
	update_biomass_recipe("biomass-chitin-xeno", nil, "chitin-xeno", nil, "biomass", 50) -- 3 chitin-xeno 1 20
	update_biomass_recipe("biomass-meat-xeno", nil, "meat-xeno", nil, "biomass", 50) -- 3 meat-xeno 1 20
	update_biomass_recipe("biomass-sulfuric-xeno", nil, "sulfuric-xeno", nil, "biomass", 50) -- 3 sulfuric-xeno 1 20
	update_biomass_recipe("biomass-xeno-egg", nil, "xeno-egg", nil, "biomass", nil) -- 3 xeno-egg 1 5
	
	-- Arqad - Tier 1
	update_biomass_recipe("biomass-arqad", nil, "arqad", nil, "biomass", 20) -- 3 arqad 1 10
	update_biomass_recipe("biomass-guts-arqad", nil, "guts-arqad", nil, "biomass", 25) -- 3 guts-arqad 1 5
	update_biomass_recipe("biomass-chitin-arqad", nil, "chitin-arqad", nil, "biomass", 25) -- 3 chitin-arqad 1 5
	update_biomass_recipe("biomass-meat-arqad", nil, "meat-arqad", nil, "biomass", 25) -- 3 meat-arqad 1 5
	update_biomass_recipe("biomass-blood-arqad", nil, "blood-arqad", nil, "biomass", 25) -- 3 blood-arqad 1 5
	update_biomass_recipe("biomass-arqad-egg", nil, "arqad-egg", nil, "biomass", 25) -- 3 arqad-egg 1 5
	update_biomass_recipe("biomass-arqad-maggot", nil, "arqad-maggot", nil, "biomass", 25) -- 3 arqad-maggot 1 5
	
	-- Zipir - Tier 2 (Science Tier 2)
	update_biomass_recipe("biomass-zipir1", nil, "zipir1", nil, "biomass", 25) -- 3 zipir1 1 20
	update_biomass_recipe("biomass-blood-zipir", nil, "blood-zipir", nil, "biomass", 30) -- 3 blood-zipir 1 25
	update_biomass_recipe("biomass-brain-zipir", nil, "brain-zipir", nil, "biomass", 30) -- 3 brain-zipir 1 25
	update_biomass_recipe("biomass-fat-zipir", nil, "fat-zipir", nil, "biomass", 30) -- 3 fat-zipir 1 25
	update_biomass_recipe("biomass-guts-zipir", nil, "guts-zipir", nil, "biomass", 30) -- 3 guts-zipir 1 25
	update_biomass_recipe("biomass-meat-zipir", nil, "meat-zipir", nil, "biomass", 30) -- 3 meat-zipir 1 25
	update_biomass_recipe("biomass-skin-zipir", nil, "skin-zipir", nil, "biomass", 30) -- 3 skin-zipir 1 25
	update_biomass_recipe("biomass-zipir-eggs", nil, "zipir-eggs", nil, "biomass", nil) -- 3 zipir-eggs 1 5
	update_biomass_recipe("biomass-zipir-pup", nil, "zipir-pup", nil, "biomass", 12) -- 3 zipir-pup 1 10
	
	-- Trit - Tier 3 (Science Tier 3)
	update_biomass_recipe("biomass-trits", nil, "trits", nil, "biomass", nil) -- 3 trits 1 30
	update_biomass_recipe("biomass-blood-trits", nil, "blood-trits", nil, "biomass", 40) -- 3 blood-trits 1 35
	update_biomass_recipe("biomass-brain-trits", nil, "brain-trits", nil, "biomass", 40) -- 3 brain-trits 1 35
	update_biomass_recipe("biomass-fat-trits", nil, "fat-trits", nil, "biomass", 40) -- 3 fat-trits 1 35
	update_biomass_recipe("biomass-guts-trits", nil, "guts-trits", nil, "biomass", 40) -- 3 guts-trits 1 35
	update_biomass_recipe("biomass-meat-trits", nil, "meat-trits", nil, "biomass", 40) -- 3 meat-trits 1 35
	update_biomass_recipe("biomass-skin-trits", nil, "skin-trits", nil, "biomass", 40) -- 3 skin-trits 1 35
	update_biomass_recipe("biomass-bone-trits", nil, "bone-trits", nil, "biomass", 40) -- 3 bone-trits 1 35
	update_biomass_recipe("biomass-trits-pup", nil, "trits-pup", nil, "biomass", 15) -- 3 trits-pup 1 20
	
	-- Xyhiphoe - Tier 2 (Science Tier 2)
	update_biomass_recipe("biomass-xyhiphoe", nil, "xyhiphoe", nil, "biomass", 25) -- 3 xyhiphoe 1 10
	update_biomass_recipe("biomass-blood-xyhiphoe", nil, "blood-xyhiphoe", nil, "biomass", 30) -- 3 blood-xyhiphoe 1 10
	update_biomass_recipe("biomass-meat-xyhiphoe", nil, "meat-xyhiphoe", nil, "biomass", 30) -- 3 meat-xyhiphoe 1 10
	update_biomass_recipe("biomass-guts-xyhiphoe", nil, "guts-xyhiphoe", nil, "biomass", 30) -- 3 guts-xyhiphoe 1 10
	update_biomass_recipe("biomass-shell-xyhiphoe", nil, "shell-xyhiphoe", nil, "biomass", 30) -- 3 shell-xyhiphoe 1 10
	update_biomass_recipe("biomass-shell", nil, "shell", nil, "biomass", nil) -- 3 shell 1 1
	update_biomass_recipe("biomass-xyhiphoe-cub", nil, "xyhiphoe-cub", nil, "biomass", 12) -- 3 xyhiphoe-cub 1 1
	update_biomass_recipe("biomass-xyhiphoe-blood", nil, "arthropod-blood", 50, "biomass", 20) -- 3 arthropod-blood 10 10
	update_biomass_recipe("biomass-arthropod-blood", nil, "arthropod-blood", 50, "biomass", 20) -- 3 arthropod-blood 10 5
	
	-- Korlex - Tier 2 (Science Tier 2)
	update_biomass_recipe("biomass-korlex", nil, "korlex", nil, "biomass", 25) -- 3 korlex 1 10
	update_biomass_recipe("biomass-caged-korlex", nil, "caged-korlex", nil, "biomass", 25) -- 3 caged-korlex 1 10
	update_biomass_recipe("biomass-blood-caged-korlex", nil, "blood-caged-korlex", nil, "biomass", 30) -- 3 blood-caged-korlex 1 10
	update_biomass_recipe("biomass-bone-caged-korlex", nil, "bone-caged-korlex", nil, "biomass", 30) -- 3 bone-caged-korlex 1 10
	update_biomass_recipe("biomass-brain-caged-korlex", nil, "brain-caged-korlex", nil, "biomass", 30) -- 3 brain-caged-korlex 1 10
	update_biomass_recipe("biomass-fat-caged-korlex", nil, "fat-caged-korlex", nil, "biomass", 30) -- 3 fat-caged-korlex 1 10
	update_biomass_recipe("biomass-guts-caged-korlex", nil, "guts-caged-korlex", nil, "biomass", 30) -- 3 guts-caged-korlex 1 10
	update_biomass_recipe("biomass-meat-caged-korlex", nil, "meat-caged-korlex", nil, "biomass", 30) -- 3 meat-caged-korlex 1 10
	update_biomass_recipe("biomass-skin-caged-korlex", nil, "skin-caged-korlex", nil, "biomass", 30) -- 3 skin-caged-korlex 1 10
	update_biomass_recipe("biomass-korlex-pup", nil, "korlex-pup", nil, "biomass", 12) -- 3 korlex-pup 1 5
	
	-- Cottongut - Tier 0
	update_biomass_recipe("biomass-cottongut", nil, "cottongut", nil, "biomass", nil) -- 3 cottongut 10 5
	update_biomass_recipe("biomass-cottongut-pup", nil, "cottongut-pup", nil, "biomass", nil) -- 3 cottongut-pup 10 3
	update_biomass_recipe("biomass-blood-cottongut", nil, "blood-cottongut", nil, "biomass", nil) -- 3 blood-cottongut 5 5
	update_biomass_recipe("biomass-bone-cottongut", nil, "bone-cottongut", nil, "biomass", nil) -- 3 bone-cottongut 5 5
	update_biomass_recipe("biomass-brain-cottongut", nil, "brain-cottongut", nil, "biomass", nil) -- 3 brain-cottongut 5 5
	update_biomass_recipe("biomass-fat-cottongut", nil, "fat-cottongut", nil, "biomass", nil) -- 3 fat-cottongut 5 5
	update_biomass_recipe("biomass-guts-cottongut", nil, "guts-cottongut", nil, "biomass", nil) -- 3 guts-cottongut 5 5
	update_biomass_recipe("biomass-meat-cottongut", nil, "meat-cottongut", nil, "biomass", nil) -- 3 meat-cottongut 5 5
	update_biomass_recipe("biomass-skin-cottongut", nil, "skin-cottongut", nil, "biomass", nil) -- 3 skin-cottongut 5 5
	update_biomass_recipe("biomass-cottongut-mk01", nil, "cottongut-mk01", nil, "biomass", nil) -- 3 cottongut-mk01 1 5
	
	-- Fish - Tier 0
	update_biomass_recipe("biomass-fish", nil, "fish", 10, "biomass", 30) -- 3 fish 1 5
	update_biomass_recipe("biomass-fish-egg", nil, "fish-egg", 10, "biomass", 10) -- 3 fish-egg 1 4
	
	-- Sea Sponge - Tier 0
	update_biomass_recipe("biomass-sea-sponge", nil, "sea-sponge", 10, "biomass", 10) -- 3 sea-sponge 1 5
	update_biomass_recipe("biomass-sea-sponge-sprouts", nil, "sea-sponge-sprouts", 10, "biomass", 10) -- 3 sea-sponge-sprouts 1 10
	
	-- ----------------------------------------------------------------------
	-- Oil Products / Liquids
	-- ----------------------------------------------------------------------
	
	update_biomass_recipe("biomass-condensates", nil, "condensates", nil, "biomass", 1) -- 3 condensates 10 4
	update_biomass_recipe("biomass-condensed-distillate", nil, "condensed-distillate", nil, "biomass", 1) -- 3 condensed-distillate 10 4
	update_biomass_recipe("biomass-naphtha", nil, "naphtha", nil, "biomass", 1) -- 3 naphtha 10 5
	update_biomass_recipe("biomass-scrude", nil, "scrude", nil, "biomass", 1) -- 3 scrude 10 3
	update_biomass_recipe("biomass-tar", nil, "tar", nil, "biomass", 1) -- 3 tar 20 4
	update_biomass_recipe("biomass-crude-oil", nil, "crude-oil", nil, "biomass", 1) -- 3 crude-oil 20 5
	update_biomass_recipe("biomass-aromatics", nil, "aromatics", nil, "biomass", 1) -- 3 aromatics 10 5
	update_biomass_recipe("biomass-glycerol", nil, "glycerol", nil, "biomass", 1) -- 3 glycerol 10 10
	update_biomass_recipe("biomass-oleochemicals", nil, "oleochemicals", nil, "biomass", 2) -- 3 oleochemicals 10 10
	update_biomass_recipe("biomass-tall-oil", nil, "tall-oil", nil, "biomass", 1) -- 3 tall-oil 10 8
	update_biomass_recipe("biomass-black-liquor", nil, "black-liquor", nil, "biomass", 5) -- 3 black-liquor 10 10
	update_biomass_recipe("biomass-ethanol", nil, "ethanol", nil, "biomass", nil) -- 3 ethanol 10 5
	update_biomass_recipe("biomass-fish-oil", nil, "fish-oil", nil, "biomass", 2) -- 3 fish-oil 10 8
	update_biomass_recipe("biomass-a-molasse", nil, "a-molasse", nil, "biomass", 5) -- 3 a-molasse 30 12
	update_biomass_recipe("biomass-b-molasse", nil, "b-molasse", 30, "biomass", 2) -- 3 b-molasse 10 12
	update_biomass_recipe("biomass-casein-mixture", nil, "casein-mixture", 100, "biomass", nil) -- 3 casein-mixture 10 7
	update_biomass_recipe("biomass-casein-pulp-01", nil, "casein-pulp-01", 100, "biomass", nil) -- 3 casein-pulp-01 10 8
	update_biomass_recipe("biomass-casein-pulp-02", nil, "casein-pulp-02", 100, "biomass", nil) -- 3 casein-pulp-02 10 9
	update_biomass_recipe("biomass-casein-solution", nil, "casein-solution", 100, "biomass", nil) -- 3 casein-solution 10 10
	update_biomass_recipe("biomass-depolymerized-organics", nil, "depolymerized-organics", nil, "biomass", 10) -- 3 depolymerized-organics 10 15
	update_biomass_recipe("biomass-fetal-serum", nil, "fetal-serum", nil, "biomass", nil) -- 3 fetal-serum 10 4
	update_biomass_recipe("biomass-flavonoids", nil, "flavonoids", nil, "biomass", 4) -- 3 flavonoids 10 15
	update_biomass_recipe("biomass-milk", nil, "milk", nil, "biomass", 4) -- 3 milk 10 5
	update_biomass_recipe("biomass-sweet-syrup", nil, "sweet-syrup", nil, "biomass", 4) -- 3 sweet-syrup 10 8
	update_biomass_recipe("biomass-liquid-manure", nil, "liquid-manure", nil, "biomass", 4) -- 3 liquid-manure 10 5
	update_biomass_recipe("biomass-syrup-01", nil, "syrup-01", nil, "biomass", 5) -- 3 syrup-01 10 7
	update_biomass_recipe("biomass-raw-ralesia-extract", nil, "raw-ralesia-extract", nil, "biomass", 2) -- 3 raw-ralesia-extract 10 5
	update_biomass_recipe("biomass-ralesia-extract", nil, "ralesia-extract", nil, "biomass", 3) -- 3 ralesia-extract 10 5
	
	-- ----------------------------------------------------------------------
	-- Other
	-- ----------------------------------------------------------------------
	update_biomass_recipe("biomass-fawogae-substrate", nil, "fawogae-substrate", 10, "biomass", 10) -- 3 fawogae-substrate 1 5 (Basic Substrate)
	update_biomass_recipe("biomass-fungal-substrate", nil, "fungal-substrate", 10, "biomass", 10) -- 3 fungal-substrate 1 4
	update_biomass_recipe("biomass-fungal-substrate-02", nil, "fungal-substrate-02", 10, "biomass", 10) -- 3 fungal-substrate-02 1 5
	update_biomass_recipe("biomass-fungal-substrate-03", nil, "fungal-substrate-03", 10, "biomass", 10) -- 3 fungal-substrate-03 1 6
	update_biomass_recipe("biomass-fertilizer", nil, "fertilizer", nil, "biomass", 40) -- 3 fertilizer 1 15
	update_biomass_recipe("biomass-manure", nil, "manure", nil, "biomass", nil) -- 3 manure 10 80
	update_biomass_recipe("biomass-chelator", nil, "chelator", nil, "biomass", 1) -- 3 chelator 10 12
	update_biomass_recipe("biomass-psc", nil, "psc", nil, "biomass", nil) -- 3 psc 5 5
	
	-- ----------------------------------------------------------------------
	-- Unused
	-- ----------------------------------------------------------------------
	update_biomass_recipe("biomass-ralesias", nil, "ralesias", nil, "biomass", nil) -- 3 ralesias 5 2

	-- ----------------------------------------------------------------------
	-- OK I guess
	-- ----------------------------------------------------------------------
	update_biomass_recipe("biomass-dried-grods", nil, "dried-grods", nil, "biomass", nil) -- 3 dried-grods 1 1
	update_biomass_recipe("biomass-petri-dish", nil, "petri-dish", nil, "biomass", nil) -- 3 petri-dish 1 1
	update_biomass_recipe("biomass-petri-dish-bacteria", nil, "petri-dish-bacteria", nil, "biomass", nil) -- 3 petri-dish-bacteria 1 1
	
	-- ----------------------------------------------------------------------
	-- Not important - disposal recipes or expensive recipes - cannot be exploited
	-- ----------------------------------------------------------------------
	update_biomass_recipe("biomass-sap-tree-mk02", nil, "sap-tree-mk02", nil, "biomass", nil) -- 3 sap-tree-mk02 1 15
	update_biomass_recipe("biomass-sap-tree-mk03", nil, "sap-tree-mk03", nil, "biomass", nil) -- 3 sap-tree-mk03 1 25
	update_biomass_recipe("biomass-sap-tree-mk04", nil, "sap-tree-mk04", nil, "biomass", nil) -- 3 sap-tree-mk04 1 35
	update_biomass_recipe("biomass-ralesias-mk02", nil, "ralesias-mk02", nil, "biomass", nil) -- 3 ralesias-mk02 1 2
	update_biomass_recipe("biomass-ralesias-mk03", nil, "ralesias-mk03", nil, "biomass", nil) -- 3 ralesias-mk03 1 2
	update_biomass_recipe("biomass-ralesias-mk04", nil, "ralesias-mk04", nil, "biomass", nil) -- 3 ralesias-mk04 1 2
	update_biomass_recipe("biomass-kicalk-mk02", nil, "kicalk-mk02", nil, "biomass", nil) -- 3 kicalk-mk02 4 300
	update_biomass_recipe("biomass-kicalk-mk03", nil, "kicalk-mk03", nil, "biomass", nil) -- 3 kicalk-mk03 4 320
	update_biomass_recipe("biomass-kicalk-mk04", nil, "kicalk-mk04", nil, "biomass", nil) -- 3 kicalk-mk04 4 340
	update_biomass_recipe("biomass-rennea-mk02", nil, "rennea-mk02", nil, "biomass", nil) -- 3 rennea-mk02 1 1
	update_biomass_recipe("biomass-rennea-mk03", nil, "rennea-mk03", nil, "biomass", nil) -- 3 rennea-mk03 1 1
	update_biomass_recipe("biomass-rennea-mk04", nil, "rennea-mk04", nil, "biomass", nil) -- 3 rennea-mk04 1 1
	update_biomass_recipe("biomass-cadaveric-arum-mk02-a", nil, "cadaveric-arum-mk02-a", nil, "biomass", nil) -- 3 cadaveric-arum-mk02-a 1 5
	update_biomass_recipe("biomass-cadaveric-arum-mk03-a", nil, "cadaveric-arum-mk03-a", nil, "biomass", nil) -- 3 cadaveric-arum-mk03-a 1 5
	update_biomass_recipe("biomass-cadaveric-arum-mk04-a", nil, "cadaveric-arum-mk04-a", nil, "biomass", nil) -- 3 cadaveric-arum-mk04-a 1 5
	update_biomass_recipe("biomass-grod-mk02", nil, "grod-mk02", nil, "biomass", nil) -- 3 grod-mk02 1 5
	update_biomass_recipe("biomass-grod-mk03", nil, "grod-mk03", nil, "biomass", nil) -- 3 grod-mk03 1 5
	update_biomass_recipe("biomass-grod-mk04", nil, "grod-mk04", nil, "biomass", nil) -- 3 grod-mk04 1 5
	update_biomass_recipe("biomass-fawogae-spore-mk02", nil, "fawogae-spore-mk02", nil, "biomass", nil) -- 3 fawogae-spore-mk02 1 15
	update_biomass_recipe("biomass-fawogae-spore-mk03", nil, "fawogae-spore-mk03", nil, "biomass", nil) -- 3 fawogae-spore-mk03 1 18
	update_biomass_recipe("biomass-fawogae-spore-mk04", nil, "fawogae-spore-mk04", nil, "biomass", nil) -- 3 fawogae-spore-mk04 1 20
	update_biomass_recipe("biomass-fawogae-mk02", nil, "fawogae-mk02", nil, "biomass", nil) -- 3 fawogae-mk02 20 65
	update_biomass_recipe("biomass-fawogae-mk03", nil, "fawogae-mk03", nil, "biomass", nil) -- 3 fawogae-mk03 20 70
	update_biomass_recipe("biomass-fawogae-mk04", nil, "fawogae-mk04", nil, "biomass", nil) -- 3 fawogae-mk04 20 75
	update_biomass_recipe("biomass-tuuphra-mk02", nil, "tuuphra-mk02", nil, "biomass", nil) -- 3 tuuphra-mk02 1 15
	update_biomass_recipe("biomass-tuuphra-mk03", nil, "tuuphra-mk03", nil, "biomass", nil) -- 3 tuuphra-mk03 1 20
	update_biomass_recipe("biomass-tuuphra-mk04", nil, "tuuphra-mk04", nil, "biomass", nil) -- 3 tuuphra-mk04 1 25
	update_biomass_recipe("biomass-yotoi-mk02", nil, "yotoi-mk02", nil, "biomass", nil) -- 3 yotoi-mk02 1 25
	update_biomass_recipe("biomass-yotoi-mk03", nil, "yotoi-mk03", nil, "biomass", nil) -- 3 yotoi-mk03 1 35
	update_biomass_recipe("biomass-yotoi-mk04", nil, "yotoi-mk04", nil, "biomass", nil) -- 3 yotoi-mk04 1 45
	update_biomass_recipe("biomass-yaedols-mk02", nil, "yaedols-mk02", nil, "biomass", nil) -- 3 yaedols-mk02 1 20
	update_biomass_recipe("biomass-yaedols-mk03", nil, "yaedols-mk03", nil, "biomass", nil) -- 3 yaedols-mk03 1 30
	update_biomass_recipe("biomass-yaedols-mk04", nil, "yaedols-mk04", nil, "biomass", nil) -- 3 yaedols-mk04 1 40
	update_biomass_recipe("biomass-moondrop-mk02", nil, "moondrop-mk02", nil, "biomass", nil) -- 3 moondrop-mk02 5 1
	update_biomass_recipe("biomass-moondrop-mk03", nil, "moondrop-mk03", nil, "biomass", nil) -- 3 moondrop-mk03 5 1
	update_biomass_recipe("biomass-moondrop-mk04", nil, "moondrop-mk04", nil, "biomass", nil) -- 3 moondrop-mk04 5 1
	update_biomass_recipe("biomass-zipir2", nil, "zipir2", nil, "biomass", nil) -- 3 zipir2 1 30
	update_biomass_recipe("biomass-zipir3", nil, "zipir3", nil, "biomass", nil) -- 3 zipir3 1 40
	update_biomass_recipe("biomass-zipir4", nil, "zipir4", nil, "biomass", nil) -- 3 zipir4 1 50
	update_biomass_recipe("biomass-arqad-mk02", nil, "arqad-mk02", nil, "biomass", nil) -- 3 arqad-mk02 1 20
	update_biomass_recipe("biomass-arqad-mk03", nil, "arqad-mk03", nil, "biomass", nil) -- 3 arqad-mk03 1 30
	update_biomass_recipe("biomass-arqad-mk04", nil, "arqad-mk04", nil, "biomass", nil) -- 3 arqad-mk04 1 40
	update_biomass_recipe("biomass-xeno-mk02", nil, "xeno-mk02", nil, "biomass", nil) -- 3 xeno-mk02 1 20
	update_biomass_recipe("biomass-xeno-mk03", nil, "xeno-mk03", nil, "biomass", nil) -- 3 xeno-mk03 1 30
	update_biomass_recipe("biomass-xeno-mk04", nil, "xeno-mk04", nil, "biomass", nil) -- 3 xeno-mk04 1 40
	update_biomass_recipe("biomass-xyhiphoe-mk02", nil, "xyhiphoe-mk02", nil, "biomass", nil) -- 3 xyhiphoe-mk02 1 15
	update_biomass_recipe("biomass-xyhiphoe-mk03", nil, "xyhiphoe-mk03", nil, "biomass", nil) -- 3 xyhiphoe-mk03 1 20
	update_biomass_recipe("biomass-xyhiphoe-mk04", nil, "xyhiphoe-mk04", nil, "biomass", nil) -- 3 xyhiphoe-mk04 1 25
	update_biomass_recipe("biomass-vrauks-mk02", nil, "vrauks-mk02", nil, "biomass", nil) -- 3 vrauks-mk02 1 10
	update_biomass_recipe("biomass-vrauks-mk03", nil, "vrauks-mk03", nil, "biomass", nil) -- 3 vrauks-mk03 1 12
	update_biomass_recipe("biomass-vrauks-mk04", nil, "vrauks-mk04", nil, "biomass", nil) -- 3 vrauks-mk04 1 14
	update_biomass_recipe("biomass-vonix-mk02", nil, "vonix-mk02", nil, "biomass", nil) -- 3 vonix-mk02 1 50
	update_biomass_recipe("biomass-vonix-mk03", nil, "vonix-mk03", nil, "biomass", nil) -- 3 vonix-mk03 1 60
	update_biomass_recipe("biomass-vonix-mk04", nil, "vonix-mk04", nil, "biomass", nil) -- 3 vonix-mk04 1 70
	update_biomass_recipe("biomass-ulric-mk02", nil, "ulric-mk02", nil, "biomass", nil) -- 3 ulric-mk02 1 10
	update_biomass_recipe("biomass-ulric-mk03", nil, "ulric-mk03", nil, "biomass", nil) -- 3 ulric-mk03 1 12
	update_biomass_recipe("biomass-ulric-mk04", nil, "ulric-mk04", nil, "biomass", nil) -- 3 ulric-mk04 1 14
	update_biomass_recipe("biomass-trits-mk02", nil, "trits-mk02", nil, "biomass", nil) -- 3 trits-mk02 1 40
	update_biomass_recipe("biomass-trits-mk03", nil, "trits-mk03", nil, "biomass", nil) -- 3 trits-mk03 1 50
	update_biomass_recipe("biomass-trits-mk04", nil, "trits-mk04", nil, "biomass", nil) -- 3 trits-mk04 1 60
	update_biomass_recipe("biomass-scrondrix-mk02", nil, "scrondrix-mk02", nil, "biomass", nil) -- 3 scrondrix-mk02 1 20
	update_biomass_recipe("biomass-scrondrix-mk03", nil, "scrondrix-mk03", nil, "biomass", nil) -- 3 scrondrix-mk03 1 20
	update_biomass_recipe("biomass-scrondrix-mk04", nil, "scrondrix-mk04", nil, "biomass", nil) -- 3 scrondrix-mk04 1 20
	update_biomass_recipe("biomass-sea-sponge-mk02", nil, "sea-sponge-mk02", nil, "biomass", nil) -- 3 sea-sponge-mk02 1 5
	update_biomass_recipe("biomass-sea-sponge-mk03", nil, "sea-sponge-mk03", nil, "biomass", nil) -- 3 sea-sponge-mk03 1 5
	update_biomass_recipe("biomass-sea-sponge-mk04", nil, "sea-sponge-mk04", nil, "biomass", nil) -- 3 sea-sponge-mk04 1 5
	update_biomass_recipe("biomass-korlex-mk02", nil, "korlex-mk02", nil, "biomass", nil) -- 3 korlex-mk02 1 10
	update_biomass_recipe("biomass-korlex-mk03", nil, "korlex-mk03", nil, "biomass", nil) -- 3 korlex-mk03 1 10
	update_biomass_recipe("biomass-korlex-mk04", nil, "korlex-mk04", nil, "biomass", nil) -- 3 korlex-mk04 1 10
	update_biomass_recipe("biomass-phadai-mk02", nil, "phadai-mk02", nil, "biomass", nil) -- 3 phadai-mk02 1 10
	update_biomass_recipe("biomass-phadai-mk03", nil, "phadai-mk03", nil, "biomass", nil) -- 3 phadai-mk03 1 10
	update_biomass_recipe("biomass-phadai-mk04", nil, "phadai-mk04", nil, "biomass", nil) -- 3 phadai-mk04 1 10
	update_biomass_recipe("biomass-phagnot-mk02", nil, "phagnot-mk02", nil, "biomass", nil) -- 3 phagnot-mk02 1 12
	update_biomass_recipe("biomass-phagnot-mk03", nil, "phagnot-mk03", nil, "biomass", nil) -- 3 phagnot-mk03 1 12
	update_biomass_recipe("biomass-phagnot-mk04", nil, "phagnot-mk04", nil, "biomass", nil) -- 3 phagnot-mk04 1 12
	update_biomass_recipe("biomass-navens-mk02", nil, "navens-mk02", nil, "biomass", nil) -- 3 navens-mk02 1 10
	update_biomass_recipe("biomass-navens-mk03", nil, "navens-mk03", nil, "biomass", nil) -- 3 navens-mk03 1 10
	update_biomass_recipe("biomass-navens-mk04", nil, "navens-mk04", nil, "biomass", nil) -- 3 navens-mk04 1 10
	update_biomass_recipe("biomass-fish-mk02", nil, "fish-mk02", nil, "biomass", nil) -- 3 fish-mk02 1 5
	update_biomass_recipe("biomass-fish-mk03", nil, "fish-mk03", nil, "biomass", nil) -- 3 fish-mk03 1 5
	update_biomass_recipe("biomass-fish-mk04", nil, "fish-mk04", nil, "biomass", nil) -- 3 fish-mk04 1 5
	update_biomass_recipe("biomass-dingrits-mk02", nil, "dingrits-mk02", nil, "biomass", nil) -- 3 dingrits-mk02 1 20
	update_biomass_recipe("biomass-dingrits-mk03", nil, "dingrits-mk03", nil, "biomass", nil) -- 3 dingrits-mk03 1 20
	update_biomass_recipe("biomass-dingrits-mk04", nil, "dingrits-mk04", nil, "biomass", nil) -- 3 dingrits-mk04 1 20
	update_biomass_recipe("biomass-mukmoux-mk02", nil, "mukmoux-mk02", nil, "biomass", nil) -- 3 mukmoux-mk02 1 25
	update_biomass_recipe("biomass-mukmoux-mk03", nil, "mukmoux-mk03", nil, "biomass", nil) -- 3 mukmoux-mk03 1 25
	update_biomass_recipe("biomass-mukmoux-mk04", nil, "mukmoux-mk04", nil, "biomass", nil) -- 3 mukmoux-mk04 1 25
	update_biomass_recipe("biomass-kmauts-mk02", nil, "kmauts-mk02", nil, "biomass", nil) -- 3 kmauts-mk02 1 10
	update_biomass_recipe("biomass-kmauts-mk03", nil, "kmauts-mk03", nil, "biomass", nil) -- 3 kmauts-mk03 1 10
	update_biomass_recipe("biomass-kmauts-mk04", nil, "kmauts-mk04", nil, "biomass", nil) -- 3 kmauts-mk04 1 10
	update_biomass_recipe("biomass-dhilmos-mk02", nil, "dhilmos-mk02", nil, "biomass", nil) -- 3 dhilmos-mk02 1 15
	update_biomass_recipe("biomass-dhilmos-mk03", nil, "dhilmos-mk03", nil, "biomass", nil) -- 3 dhilmos-mk03 1 15
	update_biomass_recipe("biomass-dhilmos-mk04", nil, "dhilmos-mk04", nil, "biomass", nil) -- 3 dhilmos-mk04 1 15
	update_biomass_recipe("biomass-cottongut-mk02", nil, "cottongut-mk02", nil, "biomass", nil) -- 3 cottongut-mk02 1 5
	update_biomass_recipe("biomass-cottongut-mk03", nil, "cottongut-mk03", nil, "biomass", nil) -- 3 cottongut-mk03 1 5
	update_biomass_recipe("biomass-cottongut-mk04", nil, "cottongut-mk04", nil, "biomass", nil) -- 3 cottongut-mk04 1 5
	update_biomass_recipe("biomass-bhoddos-mk02", nil, "bhoddos-mk02", nil, "biomass", nil) -- 3 bhoddos-mk02 1 5
	update_biomass_recipe("biomass-bhoddos-mk03", nil, "bhoddos-mk03", nil, "biomass", nil) -- 3 bhoddos-mk03 1 5
	update_biomass_recipe("biomass-bhoddos-mk04", nil, "bhoddos-mk04", nil, "biomass", nil) -- 3 bhoddos-mk04 1 5
	update_biomass_recipe("biomass-arthurian-mk02", nil, "arthurian-mk02", nil, "biomass", nil) -- 3 arthurian-mk02 1 10
	update_biomass_recipe("biomass-arthurian-mk03", nil, "arthurian-mk03", nil, "biomass", nil) -- 3 arthurian-mk03 1 10
	update_biomass_recipe("biomass-arthurian-mk04", nil, "arthurian-mk04", nil, "biomass", nil) -- 3 arthurian-mk04 1 10
	update_biomass_recipe("biomass-auog-mk02", nil, "auog-mk02", nil, "biomass", nil) -- 3 auog-mk02 1 20
	update_biomass_recipe("biomass-auog-mk03", nil, "auog-mk03", nil, "biomass", nil) -- 3 auog-mk03 1 20
	update_biomass_recipe("biomass-auog-mk04", nil, "auog-mk04", nil, "biomass", nil) -- 3 auog-mk04 1 20
	update_biomass_recipe("biomass-used-dingrit-mk02", nil, "used-dingrit-mk02", nil, "biomass", nil) -- 3 used-dingrit-mk02 1 10
	update_biomass_recipe("biomass-used-dingrit-mk03", nil, "used-dingrit-mk03", nil, "biomass", nil) -- 3 used-dingrit-mk03 1 20
	update_biomass_recipe("biomass-used-dingrit-mk04", nil, "used-dingrit-mk04", nil, "biomass", nil) -- 3 used-dingrit-mk04 1 30
	update_biomass_recipe("biomass-moondrop-diesel", nil, "moondrop-diesel", nil, "biomass", nil) -- 3 moondrop-diesel 1 1
	update_biomass_recipe("biomass-moondrop-fueloil", nil, "moondrop-fueloil", nil, "biomass", nil) -- 3 moondrop-fueloil 1 1
	update_biomass_recipe("biomass-moondrop-gas", nil, "moondrop-gas", nil, "biomass", nil) -- 3 moondrop-gas 1 1
	update_biomass_recipe("biomass-moondrop-kerosene", nil, "moondrop-kerosene", nil, "biomass", nil) -- 3 moondrop-kerosene 1 1
	update_biomass_recipe("biomass-arthurian-food-01", nil, "arthurian-food-01", nil, "biomass", nil) -- 3 arthurian-food-01 1 5
	update_biomass_recipe("biomass-arthurian-food-02", nil, "arthurian-food-02", nil, "biomass", nil) -- 3 arthurian-food-02 1 5
	update_biomass_recipe("biomass-auog-food-01", nil, "auog-food-01", nil, "biomass", nil) -- 3 auog-food-01 1 5
	update_biomass_recipe("biomass-auog-food-02", nil, "auog-food-02", nil, "biomass", nil) -- 3 auog-food-02 1 5
	update_biomass_recipe("biomass-cottongut-food-01", nil, "cottongut-food-01", nil, "biomass", nil) -- 3 cottongut-food-01 1 5
	update_biomass_recipe("biomass-cottongut-food-02", nil, "cottongut-food-02", nil, "biomass", nil) -- 3 cottongut-food-02 1 5
	update_biomass_recipe("biomass-dhilmos-food-01", nil, "dhilmos-food-01", nil, "biomass", nil) -- 3 dhilmos-food-01 1 5
	update_biomass_recipe("biomass-dhilmos-food-02", nil, "dhilmos-food-02", nil, "biomass", nil) -- 3 dhilmos-food-02 1 5
	update_biomass_recipe("biomass-mukmoux-food-01", nil, "mukmoux-food-01", nil, "biomass", nil) -- 3 mukmoux-food-01 1 5
	update_biomass_recipe("biomass-mukmoux-food-02", nil, "mukmoux-food-02", nil, "biomass", nil) -- 3 mukmoux-food-02 1 5
	update_biomass_recipe("biomass-phadai-food-01", nil, "phadai-food-01", nil, "biomass", nil) -- 3 phadai-food-01 1 5
	update_biomass_recipe("biomass-phadai-food-02", nil, "phadai-food-02", nil, "biomass", nil) -- 3 phadai-food-02 1 5
	update_biomass_recipe("biomass-ulric-food-01", nil, "ulric-food-01", nil, "biomass", nil) -- 3 ulric-food-01 1 5
	update_biomass_recipe("biomass-ulric-food-02", nil, "ulric-food-02", nil, "biomass", nil) -- 3 ulric-food-02 1 5
	update_biomass_recipe("biomass-dingrits-food-01", nil, "dingrits-food-01", nil, "biomass", nil) -- 3 dingrits-food-01 1 5
	update_biomass_recipe("biomass-dingrits-food-02", nil, "dingrits-food-02", nil, "biomass", nil) -- 3 dingrits-food-02 1 5
	update_biomass_recipe("biomass-fish-food-01", nil, "fish-food-01", nil, "biomass", nil) -- 3 fish-food-01 1 5
	update_biomass_recipe("biomass-fish-food-02", nil, "fish-food-02", nil, "biomass", nil) -- 3 fish-food-02 1 5
	update_biomass_recipe("biomass-korlex-food-01", nil, "korlex-food-01", nil, "biomass", nil) -- 3 korlex-food-01 1 5
	update_biomass_recipe("biomass-korlex-food-02", nil, "korlex-food-02", nil, "biomass", nil) -- 3 korlex-food-02 1 5
	update_biomass_recipe("biomass-phagnot-food-01", nil, "phagnot-food-01", nil, "biomass", nil) -- 3 phagnot-food-01 1 5
	update_biomass_recipe("biomass-phagnot-food-02", nil, "phagnot-food-02", nil, "biomass", nil) -- 3 phagnot-food-02 1 5
	update_biomass_recipe("biomass-vrauks-food-01", nil, "vrauks-food-01", nil, "biomass", nil) -- 3 vrauks-food-01 1 5
	update_biomass_recipe("biomass-vrauks-food-02", nil, "vrauks-food-02", nil, "biomass", nil) -- 3 vrauks-food-02 1 5
	update_biomass_recipe("biomass-zipir-food-01", nil, "zipir-food-01", nil, "biomass", nil) -- 3 zipir-food-01 1 5
	update_biomass_recipe("biomass-zipir-food-02", nil, "zipir-food-02", nil, "biomass", nil) -- 3 zipir-food-02 1 5
	update_biomass_recipe("biomass-bedding", nil, "bedding", nil, "biomass", nil) -- 3 bedding 1 15
	update_biomass_recipe("biomass-hmas", nil, "hmas", nil, "biomass", nil) -- 3 hmas 1 20
	update_biomass_recipe("biomass-used-auog", nil, "used-auog", nil, "biomass", nil) -- 3 used-auog 1 8
	update_biomass_recipe("biomass-used-auog-mk02", nil, "used-auog-mk02", nil, "biomass", nil) -- 3 used-auog-mk02 1 10
	update_biomass_recipe("biomass-used-auog-mk03", nil, "used-auog-mk03", nil, "biomass", nil) -- 3 used-auog-mk03 1 20
	update_biomass_recipe("biomass-used-auog-mk04", nil, "used-auog-mk04", nil, "biomass", nil) -- 3 used-auog-mk04 1 25
	update_biomass_recipe("biomass-pineal-gland", nil, "pineal-gland", nil, "biomass", nil) -- 3 pineal-gland 1 2
	update_biomass_recipe("biomass-sporopollenin", nil, "sporopollenin", nil, "biomass", nil) -- 3 sporopollenin 1 3
	update_biomass_recipe("biomass-seeds-extract-01", nil, "seeds-extract-01", nil, "biomass", nil) -- 3 seeds-extract-01 1 5
	update_biomass_recipe("biomass-sugar", nil, "sugar", nil, "biomass", nil) -- 3 sugar 1 10
	update_biomass_recipe("biomass-ag-biomass", nil, "ag-biomass", nil, "biomass", nil) -- 3 ag-biomass 1 8
	update_biomass_recipe("biomass-al-biomass", nil, "al-biomass", nil, "biomass", nil) -- 3 al-biomass 1 8
	update_biomass_recipe("biomass-albumin", nil, "albumin", nil, "biomass", nil) -- 3 albumin 1 8
	update_biomass_recipe("biomass-au-biomass", nil, "au-biomass", nil, "biomass", nil) -- 3 au-biomass 1 8
	update_biomass_recipe("biomass-co-biomass", nil, "co-biomass", nil, "biomass", nil) -- 3 co-biomass 1 8
	update_biomass_recipe("biomass-cu-biomass", nil, "cu-biomass", nil, "biomass", nil) -- 3 cu-biomass 1 8
	update_biomass_recipe("biomass-dried-meat", nil, "dried-meat", nil, "biomass", nil) -- 3 dried-meat 1 8
	update_biomass_recipe("biomass-fe-biomass", nil, "fe-biomass", nil, "biomass", nil) -- 3 fe-biomass 1 8
	update_biomass_recipe("biomass-nacl-biomass", nil, "nacl-biomass", nil, "biomass", nil) -- 3 nacl-biomass 1 8
	update_biomass_recipe("biomass-nanofibrils", nil, "nanofibrils", nil, "biomass", nil) -- 3 nanofibrils 1 20
	update_biomass_recipe("biomass-nb-biomass", nil, "nb-biomass", nil, "biomass", nil) -- 3 nb-biomass 1 8
	update_biomass_recipe("biomass-ni-biomass", nil, "ni-biomass", nil, "biomass", nil) -- 3 ni-biomass 1 8
	update_biomass_recipe("biomass-pb-biomass", nil, "pb-biomass", nil, "biomass", nil) -- 3 pb-biomass 1 8
	update_biomass_recipe("biomass-s-biomass", nil, "s-biomass", nil, "biomass", nil) -- 3 s-biomass 1 8
	update_biomass_recipe("biomass-sn-biomass", nil, "sn-biomass", nil, "biomass", nil) -- 3 sn-biomass 1 8
	update_biomass_recipe("biomass-ti-biomass", nil, "ti-biomass", nil, "biomass", nil) -- 3 ti-biomass 1 8
	update_biomass_recipe("biomass-zn-biomass", nil, "zn-biomass", nil, "biomass", nil) -- 3 zn-biomass 1 8
	update_biomass_recipe("biomass-kmauts-ration", nil, "kmauts-ration", nil, "biomass", nil) -- 3 kmauts-ration 1 5
	update_biomass_recipe("biomass-phagnot-cub", nil, "phagnot-cub", nil, "biomass", nil) -- 3 phagnot-cub 1 10
	update_biomass_recipe("biomass-phagnot-cub-mk02", nil, "phagnot-cub-mk02", nil, "biomass", nil) -- 3 phagnot-cub-mk02 1 10
	update_biomass_recipe("biomass-phagnot-cub-mk03", nil, "phagnot-cub-mk03", nil, "biomass", nil) -- 3 phagnot-cub-mk03 1 10
	update_biomass_recipe("biomass-phagnot-cub-mk04", nil, "phagnot-cub-mk04", nil, "biomass", nil) -- 3 phagnot-cub-mk04 1 10
	update_biomass_recipe("biomass-photophore", nil, "photophore", nil, "biomass", nil) -- 3 photophore 1 5
	update_biomass_recipe("biomass-casein", nil, "casein", nil, "biomass", nil) -- 3 casein 1 6
	update_biomass_recipe("biomass-chitin", nil, "chitin", nil, "biomass", nil) -- 3 chitin 1 5
	update_biomass_recipe("biomass-chitosan", nil, "chitosan", nil, "biomass", nil) -- 3 chitosan 1 8
	update_biomass_recipe("biomass-nano-cellulose", nil, "nano-cellulose", nil, "biomass", nil) -- 3 nano-cellulose 1 10
	update_biomass_recipe("biomass-antelope", nil, "antelope", nil, "biomass", nil) -- 3 antelope 1 12
	update_biomass_recipe("biomass-dry-ralesia", nil, "dry-ralesia", nil, "biomass", nil) -- 3 dry-ralesia 1 1
	update_biomass_recipe("biomass-ralesia-powder", nil, "ralesia-powder", nil, "biomass", nil) -- 3 ralesia-powder 1 1
	update_biomass_recipe("biomass-raw-fiber", nil, "raw-fiber", nil, "biomass", nil) -- 3 raw-fiber 1 3
	update_biomass_recipe("biomass-fiber", nil, "fiber", nil, "biomass", nil) -- 3 fiber 1 3
	update_biomass_recipe("biomass-micro-fiber", nil, "micro-fiber", nil, "biomass", nil) -- 3 micro-fiber 1 4
	update_biomass_recipe("biomass-myoglobin", nil, "myoglobin", nil, "biomass", nil) -- 3 myoglobin 1 1
	update_biomass_recipe("biomass-xenogenic-cells", nil, "xenogenic-cells", nil, "biomass", nil) -- 3 xenogenic-cells 5 4
end

-- for _,v in pairs(data.raw.recipe) do
	-- if (v.subgroup == "py-alienlife-compost") then
		-- local output = ""
		-- local summary = ""
		-- output = "update_biomass_recipe(\"" .. v.name .. "\""
		
		-- if (v.energy_required) then
			-- output = output .. ", " .. "nil"
			-- summary = v.energy_required .. " "
		-- end
		
		-- for _,ingr in pairs(v.ingredients) do
			-- output = output .. ", \"" .. ingr.name .. "\", " .. "nil"
			-- summary = summary .. ingr.name .. " " .. ingr.amount
		-- end
		
		-- for _,rslt in pairs(v.results) do
			-- output = output .. ", \"" .. rslt.name .. "\", " .. "nil" .. ")"
			-- summary = summary .. " " .. rslt.amount
		-- end
		
		-- log(output .. " -- " .. summary)
	-- end
-- end