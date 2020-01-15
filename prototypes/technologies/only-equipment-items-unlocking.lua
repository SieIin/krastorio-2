data:extend(
{
-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------CHARACTER EQUIPMENTS-------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
	-- -- Exoskeletons

	-- -- Imersite night visor

-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------VEHICLES EQUIPMENTS--------------------------------------------
----------------------------------------------------------------------------------------------------------------- 

-----------------------------------------------------------------------------------------------------------------
--------------------------------------------------UNIVERSAL EQUIPMENTS-------------------------------------------
-----------------------------------------------------------------------------------------------------------------
	--GENERATORS
	{
		type = "technology",
		name = "portable-generator",		
		icons = 
		{
			{ icon = kr_technologies_icons_path .. "portable-generator.png", icon_size = 128 },
			{ icon = kr_technologies_icons_path .. "overlays/equipment-overlay.png", icon_size = 128 }
		},
		icon_size = 128,
		upgrade = false,
		effects = 
		{
			{
				type = "unlock-recipe",
				recipe = "portable-generator"
			}
		},
		prerequisites = {"battery-equipment", "chemical-science-pack"},
		unit = 		
		{
			count = 120,
			ingredients = 
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack",	1},
			},
			time = 60
		}
	}
-----------------------------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------------------------- 
})