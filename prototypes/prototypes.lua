data:extend
({

	-- G.A.C.K.I.T. bomb
	{
		type = "item",
		name = "gackit-seed",
		icon = "__GACKIT__/graphics/icons/tree-09.png",
		flags = {"goes-to-quickbar"},
		subgroup = "capsule",
		order = "f-a-a",
		place_result = "gackit-seed",
		stack_size = 100
	},

	{
		type = "recipe",
		name = "gackit-seed",
		ingredients = {{"raw-wood",1}, {"alien-artifact", 10}},
		result = "gackit-seed",
		result_count = 1,
		enabled = "false"
	},
	
	{
		type = "technology",
		name = "gackit-seed",
		icon = "__GACKIT__/graphics/technology/gackit.png",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "gackit-seed"
			},
		},
		prerequisites = {"alien-technology"},
		unit =
		{
			count = 100,
			ingredients =
			{
				{"alien-science-pack", 1}
			},
			time = 30
		},
		upgrade = "false",
		order = "e-f"
	},

	{
		type = "radar",
		name = "gackit-seed",
		icon = "__GACKIT__/graphics/icons/tree-09.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation", "placeable-off-grid", "breaths-air"},   
		minable = {hardness = 0.8, mining_time = 1, result = "gackit-seed"},
		max_health = 100,
		collision_box = {{-0.1,-0.1},{0.1,0.1}},
		selection_box = {{0.1,-0.1},{0.1,0.1}},
		energy_per_sector = "9999MJ",
		max_distance_of_nearby_sector_revealed = 1,
		max_distance_of_sector_revealed = 1,
		energy_per_nearby_scan = "0kJ",
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input"
		},
		energy_usage = "0kW",
		-- Don't really want it to be visible, it gets deleted instantly anyway.
		pictures =
		{
			filename = "__GACKIT__/graphics/icons/tree-09.png",
			priority = "high",
			width = 1,
			height = 1,
			axially_symmetrical = false,
			apply_projection = false,
			direction_count = 1,
			line_length = 1,
			shift = {0, 0},
		},
	},
	
	-- Magic puff of green cloud to hide insta-summon of trees.
	{
		type = "smoke-with-trigger",
		name = "gackit-magicpuff",
		flags = {"not-on-map"},
		show_when_smoke_off = true,
		animation =
		{
			filename = "__base__/graphics/entity/cloud/cloud-45-frames.png",
			priority = "low",
			width = 256,
			height = 256,
			frame_count = 45,
			animation_speed = 3,
			line_length = 7,
			scale = 3,
		},
		slow_down_factor = 0,
		affected_by_wind = false,
		cyclic = true,
		duration = 60,
		fade_away_duration = 2 * 60,
		spread_duration = 10,
		color = { r = 0.2, g = 0.9, b = 0.2 },
		action =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-entity",
						entity_name = "medium-explosion"
					},
				}
			}
		},
		action_frequency = 30
	},
})