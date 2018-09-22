----------------------------------------------
--ORES...


---------------------------
--Intrusive stone types.


-- Obsidian
minetest.register_ore({
	ore_type        = "blob",
	ore             = "default:obsidian",
	wherein         = {
		"default:stone",
	 	"aotearoa:andesite",
		"aotearoa:granite",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 10,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -316,
		octaves = 1,
		persist = 0.0
	},
})

-- Desert stone into deep stone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "default:desert_stone",
	wherein         = {
		"default:stone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = -150,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -31666,
		octaves = 1,
		persist = 0.0
	},
})


-- gneiss into deep stone, schist
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:gneiss",
	wherein         = {
		"default:stone",
		"aotearoa:schist",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = 56752,
		octaves = 1,
		persist = 0.0
	},
})



-- schist into deep stone, greywacke
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:schist",
	wherein         = {
		"default:stone",
		"aotearoa:greywacke",
		"aotearoa:gneiss",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -89851,
		octaves = 1,
		persist = 0.0
	},
})

-- granite into deep stone, and metamorphic rocks
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:granite",
	wherein         = {
		"default:stone",
		"aotearoa:schist",
		"aotearoa:greywacke",
		"aotearoa:gneiss",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -30027,
		octaves = 1,
		persist = 0.0
	},
})


-- greywacke into deep stone and schist
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:greywacke",
	wherein         = {
		"default:stone",
		"aotearoa:schist",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -145366,
		octaves = 1,
		persist = 0.0
	},
})

-- andesite into deep stone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:andesite",
	wherein         = {
		"default:stone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -11117,
		octaves = 1,
		persist = 0.0
	},
})


-- limestone into sandstone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:limestone",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 25,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -2018,
		octaves = 1,
		persist = 0.0
	},
})

-- claystone into sandstone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:claystone",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 25,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = 1996,
		octaves = 1,
		persist = 0.0
	},
})

-- siltstone into sandstone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:siltstone",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 25,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = 1886,
		octaves = 1,
		persist = 0.0
	},
})

-- coquina into sandstone
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:coquina_limestone",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 25,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = -1999,
		octaves = 1,
		persist = 0.0
	},
})


-- conglomerate into sandstone and andesite
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:conglomerate",
	wherein         = {
		"aotearoa:andesite",
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 15,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0,
		scale = 1,
		spread = {x = 15, y = 15, z = 15},
		seed = 21106,
		octaves = 1,
		persist = 0.0
	},
})

-- Volcanic sand
minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:volcanic_sand",
	wherein         = {
		"aotearoa:andesite",	
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 4,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.02,
		spread = {x = 5, y = 5, z = 5},
		seed = 868,
		octaves = 1,
		persist = 0.0
	},
})



-----------------------------------------
--SPECIAL FEATURES

-------------------
-- West Coast Coal
minetest.register_ore({
	ore_type        = "blob",
	ore             = "default:coalblock",
	wherein         = {
		"default:desert_sandstone",
		"default:sandstone",
		"default:silver_sandstone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 5,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.02,
		spread = {x = 5, y = 5, z = 5},
		seed = 7886,
		octaves = 1,
		persist = 0.0
	},
	biomes = {
		"southern_podocarp_forest",
		"muttonbird_scrub",
		"iron_sand_dunes",
		"iron_sand_beach",
	},
})


--------------------
--Pounamu
--(technically jade, bowenite, and serpentine)

minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:pounamu",
	wherein         = {
		"aotearoa:schist",
		"default:stone",
		"default:desert_stone",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 4,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.02,
		spread = {x = 5, y = 5, z = 5},
		seed = -7181,
		octaves = 1,
		persist = 0.0
	},
	biomes = {
		"southern_podocarp_forest",
		"mountain_beech_forest",
	},
})



--------------------------
--Coromandel/Otago Gold

minetest.register_ore({
	ore_type        = "blob",
	ore             = "aotearoa:quartz_with_gold",
	wherein         = {
		"aotearoa:andesite",
		"aotearoa:schist",
	 },
	clust_scarcity  = 16 * 16 * 16,
	clust_size      = 3,
	y_min           = -31000,
	y_max           = 31000,
	noise_threshold = 0.0,
	noise_params    = {
		offset = 0.5,
		scale = 0.02,
		spread = {x = 5, y = 5, z = 5},
		seed = -7444,
		octaves = 1,
		persist = 0.0
	},
	biomes = {
		"kauri_forest",
		"pohutukawa_forest",
		"matagouri_scrub",
	},
})
