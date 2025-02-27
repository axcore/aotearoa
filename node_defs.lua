


--------------------------------
--TREE NODES
--all nodes (wood, leaves, stairs...)

--local sapling_time_tree =
--local sapling_time_shrub =
--local sapling_time_palm =


aotearoa.treelist = {
	{"pohutukawa", "Pohutukawa","\n".. minetest.colorize("#adaba0","(Metrosideros excelsa)"), 3, "flower"},
	{"kauri", "Kauri","\n".. minetest.colorize("#adaba0", "(Agathis australis)"), 2},
	{"karaka", "Karaka","\n".. minetest.colorize("#adaba0", "(Corynocarpus laevigatus)"), 3, nil,"karaka_fruit", "Karaka Fruit",{-0.2, 0, -0.2, 0.2, 0.5, 0.2},	1, -5},
	{"rimu", "Rimu","\n".. minetest.colorize("#adaba0", "(Dacrydium cupressinum)"), 3},
	{"totara", "Totara","\n".. minetest.colorize("#adaba0", "(Podocarpus totara)"), 2},
	{"miro", "Miro","\n".. minetest.colorize("#adaba0", "(Prumnopitys ferruginea)"), 2,nil, "miro_fruit", "Miro Fruit",{-0.2, 0, -0.2, 0.2, 0.5, 0.2},	1, 1},
	{"kahikatea", "Kahikatea","\n".. minetest.colorize("#adaba0", "(Dacrycarpus dacrydioides)"), 2},
  {"tawa", "Tawa","\n".. minetest.colorize("#adaba0", "(Beilschmiedia tawa)"), 3,nil, "tawa_fruit", "Tawa Fruit",{-0.2, 0, -0.2, 0.2, 0.5, 0.2},	1, 1},
  {"black_beech", "Black Beech","\n".. minetest.colorize("#adaba0", "(Fuscospora solandri)"), 2},
	{"kamahi", "Kamahi","\n".. minetest.colorize("#adaba0", "(Weinmannia racemosa)"), 2, "flower"},
	{"mountain_beech", "Mountain Beech","\n".. minetest.colorize("#adaba0", "(Fuscospora cliffortioides)"),2},
	{"pahautea", "Pahautea","\n".. minetest.colorize("#adaba0", "(Libocedrus bidwillii)"),2},
	{"kowhai", "Kowhai","\n".. minetest.colorize("#adaba0", "(Sophora microphylla)"), 3, "flower",},
	{"silver_beech", "Silver Beech","\n".. minetest.colorize("#adaba0", "(Lophozonia menziesii)"),2},
	{"black_maire", "Black Maire","\n".. minetest.colorize("#adaba0", "(Nestegis cunninghamii)"),2, "flower",},
	{"hinau", "Hinau","\n".. minetest.colorize("#adaba0", "(Elaeocarpus dentatus)"), 2,"flower", "hinau_fruit", "Hinau Fruit",{-0.2, 0, -0.2, 0.2, 0.5, 0.2},	1, 1},
}


for i in ipairs(aotearoa.treelist) do
	local treename = aotearoa.treelist[i][1]
	local treedesc = aotearoa.treelist[i][2]
	local sci_name = aotearoa.treelist[i][3]
	local decay = aotearoa.treelist[i][4]
	local type = aotearoa.treelist[i][5]
	local fruit = aotearoa.treelist[i][6]
	local fruitdesc = aotearoa.treelist[i][7]
	local selbox = aotearoa.treelist[i][8]
	local vscale = aotearoa.treelist[i][9]
	local foodvalue = aotearoa.treelist[i][10]

	-- player will get a sapling with 1/50 chance
	local droprarity = 50


		minetest.register_node("aotearoa:"..treename.."_tree", {
			description = treedesc.." Tree"..sci_name,
			tiles = {
				"aotearoa_"..treename.."_tree_top.png",
				"aotearoa_"..treename.."_tree_top.png",
				"aotearoa_"..treename.."_tree.png"
			},
			paramtype = "light",
			paramtype2 = "facedir",
			is_ground_content = false,
			groups = {tree = 1, choppy = 2, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
			on_place = minetest.rotate_node,
		})

		minetest.register_node("aotearoa:"..treename.."_wood", {
			description = treedesc.." Wooden Planks"..sci_name,
			tiles = {"aotearoa_"..treename.."_wood.png"},
			paramtype = "light",
			paramtype2 = "facedir",
			is_ground_content = false,
			groups = {choppy = 2, oddly_breakable_by_hand = 2, flammable = 2, wood = 1},
			sounds = default.node_sound_wood_defaults(),
		})

		minetest.register_node("aotearoa:"..treename.."_sapling", {
			description = treedesc.." Sapling"..sci_name,
			drawtype = "plantlike",
			tiles = {"aotearoa_"..treename.."_sapling.png"},
            -- @@@ Josselin2
--			inventory_image = {"aotearoa_"..treename.."_sapling.png"},
			inventory_image = "aotearoa_"..treename.."_sapling.png",
			paramtype = "light",
			paramtype2 = "waving",
			walkable = false,
			is_ground_content = true,
			selection_box = {
				type = "fixed",
				fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
			},
			groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1},
			sounds = default.node_sound_defaults(),
			on_timer = function(pos,elapsed)
				aotearoa.grow_sapling(pos, treename, "aotearoa:"..treename.."_tree")
			end,
			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end,
			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"aotearoa:"..treename.."_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,

		})

		--put flowering in flower group
		local g = nil
		if type == "flower" then
			g = {snappy = 3, flammable = 2, leaves = 1, leafdecay = 1, flower = 1}
		else
			g = {snappy = 3, flammable = 2, leaves = 1, leafdecay = 1}
		end

		minetest.register_node("aotearoa:"..treename.."_leaves", {
			description = treedesc.." Leaves"..sci_name,
			drawtype = "allfaces_optional",
			tiles ={"aotearoa_"..treename.."_leaves.png" },
			paramtype = "light",
			is_ground_content = false,
			walkable = false,
			--sunlight_propagates = true,
			groups = g,
			sounds = default.node_sound_leaves_defaults(),

			drop = {
				max_items = 1,
				items = {
					{items = {"aotearoa:"..treename.."_sapling"}, rarity = droprarity },
					{items = {"aotearoa:"..treename.."_leaves"} }
				}
			},
		})

	--stairs etc
	stairs.register_stair_and_slab(
		"aotearoa_"..treename.."_tree",
		"aotearoa:"..treename.."_tree",
		{snappy=1, choppy=2, oddly_breakable_by_hand=1, flammable=2 },
		{"aotearoa_"..treename.."_tree_top.png", "aotearoa_"..treename.."_tree_top.png", "aotearoa_"..treename.."_tree.png"
		},
		treedesc.." Tree Stair"..sci_name,
		treedesc.." Tree Slab"..sci_name,
		default.node_sound_wood_defaults()
	)

	stairs.register_stair_and_slab(
		"aotearoa_"..treename.."_wood",
		"aotearoa:"..treename.."_wood",
		{snappy=1, choppy=2, oddly_breakable_by_hand=2, flammable=2},
		{"aotearoa_"..treename.."_wood.png" },
		treedesc.." Wood Stair"..sci_name,
		treedesc.." Wood Slab"..sci_name,
		default.node_sound_wood_defaults()
	)

	-- fence
	default.register_fence("aotearoa:fence_"..treename.."_wood", {
		description = treedesc.." Wood Fence"..sci_name,
		texture = "aotearoa_"..treename.."_wood.png",
		material = "aotearoa:"..treename.."_wood",
		groups = {snappy=1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
	})

	--gate
	doors.register_fencegate("aotearoa:gate_"..treename.."_wood",  {
		description = treedesc.." Wood Gate"..sci_name,
		texture = "aotearoa_"..treename.."_wood.png",
		material = "aotearoa:"..treename.."_wood",
		groups = {snappy=1, choppy = 2, oddly_breakable_by_hand = 2, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
	})


	minetest.register_craft({
	output = "aotearoa:"..treename.."_wood 4",
	recipe = {
		{"aotearoa:"..treename.."_tree"},
	}
	})

	local fruitname = nil
	if fruit then
		fruitname = "aotearoa:"..fruit
		minetest.register_node(fruitname, {
			description = fruitdesc ..sci_name,
			drawtype = "plantlike",
			tiles = { "aotearoa_"..fruit..".png" },
			inventory_image = "aotearoa_"..fruit..".png",
			wield_image = "aotearoa_"..fruit..".png",
			visual_scale = vscale,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			selection_box = {
				type = "fixed",
				fixed = selbox
				},
			groups = {fleshy=3, dig_immediate=3, flammable=2, leafdecay = 3, leafdecay_drop = 1},
			on_use = minetest.item_eat(foodvalue),
			sounds = default.node_sound_defaults(),
		})

		default.register_leafdecay({
		trunks = {"aotearoa:"..treename.."_tree"},
		leaves = { "aotearoa:"..treename.."_leaves", fruitname},
		radius = decay,
		})

	else
		default.register_leafdecay({
		trunks = {"aotearoa:"..treename.."_tree"},
		leaves = { "aotearoa:"..treename.."_leaves" },
		radius = decay,
		})
	end

end


--------------------------------
--SHRUB NODES
--small trees. Thin trunks. Craft into sticks rather than wood


aotearoa.shrublist = {
	{"mangrove", "Mangrove","\n".. minetest.colorize("#adaba0","(Avicennia marina)"), 2,},
	{"karo", "Karo","\n".. minetest.colorize("#adaba0","(Pittosporum crassifolium)"), 2},
	{"kawakawa", "Kawakawa","\n".. minetest.colorize("#adaba0","(Piper excelsum)"), 2,nil, 0, "kawakawa_fruit", "Kawakawa Fruit",{-0.2, -0.5, -0.2, 0.2, 0, 0.2},	0.8, 1},
	{"manuka", "Manuka","\n".. minetest.colorize("#adaba0","(Leptospermum scoparium)"), 2, "flower",},
	{"common_tree_daisy", "Common Tree Daisy","\n".. minetest.colorize("#adaba0","(Olearia arborescens)"), 2, "flower",},
	{"matagouri", "Matagouri","\n".. minetest.colorize("#adaba0","(Discaria toumatou)"), 2, nil, 1},
	{"mahoe", "Mahoe","\n".. minetest.colorize("#adaba0","(Melicytus ramiflorus)"), 2},
	{"rangiora", "Rangiora","\n".. minetest.colorize("#adaba0","(Brachyglottis repanda)"), 2, "flower"},

}


for i in ipairs(aotearoa.shrublist) do
	local treename = aotearoa.shrublist[i][1]
	local treedesc = aotearoa.shrublist[i][2]
	local sci_name = aotearoa.shrublist[i][3]
	local decay = aotearoa.shrublist[i][4]
	local type = aotearoa.shrublist[i][5]
	local damage = aotearoa.shrublist[i][6]
	local fruit = aotearoa.shrublist[i][7]
	local fruitdesc = aotearoa.shrublist[i][8]
	local selbox = aotearoa.shrublist[i][9]
	local vscale = aotearoa.shrublist[i][10]
	local foodvalue = aotearoa.shrublist[i][11]


	-- player will get a sapling with 1/30 chance
	-- player will get leaves only if he/she gets no saplings,
	-- this is because max_items is 1

	local droprarity = 30


	local trunkbox = {-1/6, -1/2, -1/6, 1/6, 1/2, 1/6}


			minetest.register_node("aotearoa:"..treename.."_tree", {
			description = treedesc.." Tree"..sci_name,
			drawtype = "nodebox",
			tiles = {
				"aotearoa_"..treename.."_tree_top.png",
				"aotearoa_"..treename.."_tree_top.png",
				"aotearoa_"..treename.."_tree.png"
			},
			node_box = {
				type = "fixed",
				fixed = trunkbox,
			},
			selection_box = {
				type = "fixed",
				fixed = trunkbox,
			},
			paramtype = "light",
			paramtype2 = "facedir",
			climbable = true,
			is_ground_content = false,
			groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2},
			sounds = default.node_sound_wood_defaults(),
            -- @@@ Josselin2
            use_texture_alpha = "clip",            
		})

		minetest.register_node("aotearoa:"..treename.."_sapling", {
			description = treedesc.." Sapling"..sci_name,
			drawtype = "plantlike",
			tiles = {"aotearoa_"..treename.."_sapling.png"},
            -- @@@ Josselin2
--			inventory_image = {"aotearoa_"..treename.."_sapling.png"},
			inventory_image = "aotearoa_"..treename.."_sapling.png",
			paramtype = "light",
			paramtype2 = "waving",
			walkable = false,
			is_ground_content = true,
			selection_box = {
				type = "fixed",
				fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
			},
			groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1},
			sounds = default.node_sound_defaults(),
			on_timer = function(pos,elapsed)
				aotearoa.grow_shrub_sapling(pos, treename, "aotearoa:"..treename.."_tree")
			end,
			on_construct = function(pos)
				minetest.get_node_timer(pos):start(math.random(300, 1500))
			end,
			on_place = function(itemstack, placer, pointed_thing)
				itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
			"aotearoa:"..treename.."_sapling",
			-- minp, maxp to be checked, relative to sapling pos
			-- minp_relative.y = 1 because sapling pos has been checked
			{x = -2, y = 1, z = -2},
			{x = 2, y = 6, z = 2},
			-- maximum interval of interior volume check
			4)

		return itemstack
	end,

		})

		--put flowering in flower group
		local g = nil
		if type == "flower" then
			g = {snappy = 3, flammable = 2, leaves = 1, leafdecay = 1, flower = 1}
		else
			g = {snappy = 3, flammable = 2, leaves = 1, leafdecay = 1}
		end

		minetest.register_node("aotearoa:"..treename.."_leaves", {
			description = treedesc.." Leaves"..sci_name,
			drawtype = "allfaces_optional",
			tiles ={"aotearoa_"..treename.."_leaves.png" },
			paramtype = "light",
			is_ground_content = false,
			walkable = false,
			damage_per_second = damage,
			sunlight_propagates = true,
			groups = g,
			sounds = default.node_sound_leaves_defaults(),
			drop = {
				max_items = 1,
				items = {
					{items = {"aotearoa:"..treename.."_sapling"}, rarity = droprarity },
					{items = {"aotearoa:"..treename.."_leaves"} }
				}
			},
		})


	minetest.register_craft({
	output = "default:stick 2",
	recipe = {
		{"aotearoa:"..treename.."_tree"},
	}
	})

	local fruitname = nil
	if fruit then
		fruitname = "aotearoa:"..fruit
		minetest.register_node(fruitname, {
			description = fruitdesc ..sci_name,
			drawtype = "plantlike",
			tiles = { "aotearoa_"..fruit..".png" },
			inventory_image = "aotearoa_"..fruit..".png",
			wield_image = "aotearoa_"..fruit..".png",
			visual_scale = vscale,
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			selection_box = {
				type = "fixed",
				fixed = selbox
				},
			groups = {fleshy=3, dig_immediate=3, flammable=2, leafdecay = 3, leafdecay_drop = 1},
			on_use = minetest.item_eat(foodvalue),
			sounds = default.node_sound_defaults(),
		})

		default.register_leafdecay({
		trunks = {"aotearoa:"..treename.."_tree"},
		leaves = { "aotearoa:"..treename.."_leaves", fruitname},
		radius = decay,
		})

	else
		default.register_leafdecay({
		trunks = {"aotearoa:"..treename.."_tree"},
		leaves = { "aotearoa:"..treename.."_leaves" },
		radius = decay,
		})
	end

end


----------------------------------------------------------------------
--PLANT NODES
--ground cover plants

aotearoa.plantlist = {
	{"moss", "Moss","",{-0.5, -0.5, -0.5, 0.5, -0.25, 0.5},1,"crumbly","nodebox"},
	{"pohuehue", "Pohuehue","\n".. minetest.colorize("#adaba0","(Muehlenbeckia complexa)"),{-0.47, -0.5, -0.47, 0.47, 0.37,0.47},1,"sand","nodebox"},
	{"pingao", "Pingao","\n".. minetest.colorize("#adaba0","(Ficinia spiralis)"),nil,1, "sand"},
	{"spinifex", "Spinifex","\n".. minetest.colorize("#adaba0","(Spinifex sericeus)"),nil,1, "sand"},
	{"wiwi", "Wiwi","\n".. minetest.colorize("#adaba0","(Ficinia nodosa)"),nil,1, "grass", "firelike"},
	{"flax", "Flax","\n".. minetest.colorize("#adaba0","(Phormium tenax)"),nil,1.5, "flower",},
	{"bracken", "Bracken","\n".. minetest.colorize("#adaba0","(Pteridium esculentum)"),nil,1, "dry_grass","firelike"},
	{"red_tussock", "Red tussock","\n".. minetest.colorize("#adaba0","(Chionochloa rubra)"),nil,1, "dry_grass","firelike"},
	{"kiokio", "Kiokio","\n".. minetest.colorize("#adaba0","(Parablechnum novae-zelandiae)"), nil,1,nil,"firelike"},
	{"bristle_tussock", "Bristle Tussock","\n".. minetest.colorize("#adaba0","(Rytidosperma setifolium)"),nil,1, "dry_grass",},
	{"kauri_grass", "Kauri Grass","\n".. minetest.colorize("#adaba0","(Astelia trinervia)"),nil,1,nil,"firelike"},
	{"crown_fern", "Crown Fern","\n".. minetest.colorize("#adaba0","(Blechnum discolor)"),nil,1,},
	{"sea_rush", "Sea Rush","\n".. minetest.colorize("#adaba0","(Juncus kraussii)"),nil,1, "grass",},

}


for i in ipairs(aotearoa.plantlist) do
	local plantname = aotearoa.plantlist[i][1]
	local plantdesc = aotearoa.plantlist[i][2]
	local sci_name = aotearoa.plantlist[i][3]
	local selbox = aotearoa.plantlist[i][4]
	local vscale = aotearoa.plantlist[i][5]
	local type = aotearoa.plantlist[i][6]
	local draw = aotearoa.plantlist[i][7]

	if selbox == nil then
		selbox = {-0.4, -0.5, -0.4, 0.4, -0.2, 0.4}
	end

	local g = nil
	if type == "grass" then
		g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1, grass = 1}
	elseif type == "dry_grass" then
		g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1, dry_grass = 1}
	elseif type == "flower" then
		g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1, flower = 1}
	elseif type == "leaves" then
			g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1, leaves = 1}
	elseif type == "crumbly" then
			g = {crumbly = 3, attached_node = 1, flammable = 1, flora = 1}
	--anything on sand must not be in flora group or "Flowers" spams it with dry shrubs
	elseif type =="sand" then
		g = {snappy = 3, attached_node = 1, flammable = 1,}
	else
		g = {snappy = 3, attached_node = 1, flammable = 1, flora = 1}
	end

    -- @@@ Josselin2 - insert extra "if" to prevent minetest.register_node() being called twice for
    -- @@@      the same item
	if draw ~= "nodebox" then
        minetest.register_node("aotearoa:"..plantname, {
            description = plantdesc ..sci_name,
            drawtype = draw or "plantlike",
            waving = 1,
            visual_scale = vscale,
            tiles = {"aotearoa_"..plantname..".png"},
            inventory_image = "aotearoa_"..plantname..".png",
            wield_image = "aotearoa_"..plantname..".png",
            paramtype = "light",
            sunlight_propagates = true,
            walkable = false,
            buildable_to = true,
            groups = g,
            sounds = default.node_sound_leaves_defaults(),
            selection_box = {
                type = "fixed",
                fixed = selbox,
            },
            -- @@@ Josselin2
            use_texture_alpha = "clip",        
        })
	--singlenode bushes etc
	elseif draw == "nodebox" then
		minetest.register_node("aotearoa:"..plantname, {
			description = plantdesc,
			drawtype = "nodebox",
			node_box = {
				type = "fixed",
				fixed = {
					selbox,
				},
			},
			tiles = {"aotearoa_"..plantname..".png"},
			paramtype = "light",
			sunlight_propagates = true,
			is_ground_content = false,
			walkable = false,
			buildable_to = true,
			groups = g,
			sounds = default.node_sound_leaves_defaults(),
            -- @@@ Josselin2
            use_texture_alpha = "clip",        
		})
	end


	minetest.register_craft({
		type = "fuel",
		recipe = "aotearoa:"..plantname,
		burntime = 1,
	})


end


------------------------------------------
--BUSHES
--woody bushes

aotearoa.bushlist = {
	{"leatherwood", "Leatherwood","\n".. minetest.colorize("#adaba0","(Olearia colensoi)"),},
	{"kokomuka", "Kokomuka","\n".. minetest.colorize("#adaba0","(Veronica elliptica)"), "flower"},

}

for i in ipairs(aotearoa.bushlist) do
	local plantname = aotearoa.bushlist[i][1]
	local plantdesc = aotearoa.bushlist[i][2]
	local sci_name = aotearoa.bushlist[i][3]
	local type = aotearoa.bushlist[i][4]
	local nodebox = aotearoa.bushlist[i][5]

	local droprarity = 5


	if nodebox == nil then
		nodebox = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}
	end

	--put flowering in flower group
	local g = nil
	if type == "flower" then
		g = {snappy = 3, flammable = 2, leaves = 1, flower = 1,}
	else
		g = {snappy = 3, flammable = 2, leaves = 1,}
	end

	--sapling
	minetest.register_node("aotearoa:"..plantname.."_sapling", {
		description = plantdesc.." Sapling"..sci_name,
		drawtype = "plantlike",
		tiles = {"aotearoa_"..plantname.."_sapling.png"},
        -- @@@ Josselin2
--		inventory_image = {"aotearoa_"..plantname.."_sapling.png"},
		inventory_image = "aotearoa_"..plantname.."_sapling.png",
		paramtype = "light",
		paramtype2 = "waving",
		walkable = false,
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
		},
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1},
		sounds = default.node_sound_defaults(),
		on_timer = function(pos,elapsed)
			aotearoa.grow_bush_sapling(pos, plantname, "aotearoa:"..plantname.."_stem")
		end,
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
		"aotearoa:"..plantname.."_sapling",
		-- minp, maxp to be checked, relative to sapling pos
		-- minp_relative.y = 1 because sapling pos has been checked
		{x = -2, y = 1, z = -2},
		{x = 2, y = 6, z = 2},
		-- maximum interval of interior volume check
		4)

	return itemstack
end,

	})

	--leaves
	minetest.register_node("aotearoa:"..plantname, {
		description = plantdesc.. " Leaves"..sci_name,
		drawtype = "nodebox",
		node_box = {
			type = "fixed",
			fixed = {
				nodebox,
			},
		},
		tiles = {"aotearoa_"..plantname..".png"},
		paramtype = "light",
		sunlight_propagates = true,
		is_ground_content = false,
		walkable = false,
		groups = g,
		drop = {
		max_items = 1,
		items = {
			{items = {"aotearoa:"..plantname.."_sapling",}, rarity = droprarity},
			{items = {"aotearoa:"..plantname}}
		}
	},
		sounds = default.node_sound_leaves_defaults(),
        -- @@@ Josselin2
        use_texture_alpha = "clip",                        
	})

	--stem
	minetest.register_node("aotearoa:"..plantname.."_stem", {
		description = plantdesc.." Stem"..sci_name,
		drawtype = "plantlike",
		visual_scale = 1.41,
		tiles = {"aotearoa_"..plantname.."_stem.png"},
		inventory_image = "aotearoa_"..plantname.."_stem.png",
		wield_image = "aotearoa_"..plantname.."_stem.png",
		paramtype = "light",
		sunlight_propagates = true,
		groups = {choppy = 2, oddly_breakable_by_hand = 1, flammable = 2},
		sounds = default.node_sound_wood_defaults(),
		selection_box = {
			type = "fixed",
			fixed = {-7 / 16, -0.5, -7 / 16, 7 / 16, 0.5, 7 / 16},
		},
	})

	--craft stem into stick.
	minetest.register_craft({
	output = "default:stick",
	recipe = {
		{"aotearoa:"..plantname.."_stem"},
	}
	})

	--burnables
	minetest.register_craft({
		type = "fuel",
		recipe = "aotearoa:"..plantname.."_stem",
		burntime = 2,
	})


end



-------------------------------------------
--TREE FERNS & Palm style
-- Plant on a pole!

aotearoa.tfernlist = {
	{"mamaku", "Mamaku","\n".. minetest.colorize("#adaba0","(Cyathea medullaris)"), 3.5, "fern",},
	{"silver_fern", "Silver Fern","\n".. minetest.colorize("#adaba0","(Cyathea dealbata)"), 3, "fern"},
	{"wheki", "Wheki","\n".. minetest.colorize("#adaba0","(Dicksonia squarrosa)"), 2.5, "fern",nil,"skirt"},
	{"cabbage_tree", "Cabbage Tree","\n".. minetest.colorize("#adaba0","(Cordyline australis)"), 1.8,},
	{"nikau_palm", "Nikau Palm","\n".. minetest.colorize("#adaba0","(Rhopalostylis sapida)"), 3.5,"",nil,"skirt"},


}

for i in ipairs(aotearoa.tfernlist) do
	local treename = aotearoa.tfernlist[i][1]
	local treedesc = aotearoa.tfernlist[i][2]
	local sci_name = aotearoa.tfernlist[i][3]
	local crownscale = aotearoa.tfernlist[i][4]
	local treetype = aotearoa.tfernlist[i][5]
	local crownbox = aotearoa.tfernlist[i][6]
	local skirt = aotearoa.tfernlist[i][7]


	-- player will get a sapling with 1/10 chance
	local droprarity = 3

	local trunkbox = {-1/6, -1/2, -1/6, 1/6, 1/2, 1/6}
	--set a default selection box, for those that don't need special treatment
	if crownbox == nil then
		crownbox = {-7/16, -1/2, -7/16, 7/16, 0, 7/16}
	end

	--special treatment for treeferns
	--give ferns spores, no sticks, same tree top image
	local treetop_image = nil
	local sapimage = nil
	local sapdesc = nil
	local sapdraw = nil
	local sapbox = nil
	if treetype == "fern" then
		treetop_image = "aotearoa_tree_fern_top.png"
		sapimage = "aotearoa_tree_fern_spores.png"
		sapdesc = treedesc.." Spores"
		sapdraw = "nodebox"
		sapbox = {-0.5, -0.5, -0.5,  0.5, -0.48, 0.5}
	else
		treetop_image = "aotearoa_"..treename.."_tree_top.png"
		sapimage = "aotearoa_"..treename.."_sapling.png"
		sapdesc = treedesc.." Sapling"
		sapdraw = "plantlike"
		sapbox = {-0.3, -0.5, -0.3, 0.3, 0.35, 0.3}
		--and while we are here...(ferns a useless stick!)
		minetest.register_craft({
			output = "default:stick 2",
			recipe = {
				{"aotearoa:"..treename.."_tree"},
			}
		})
	end


	-- trunk
	minetest.register_node("aotearoa:"..treename.."_tree", {
		description = treedesc .." Trunk "..sci_name,
		drawtype = "nodebox",
		tiles = {
			treetop_image,
			treetop_image,
			"aotearoa_"..treename.."_tree.png"
		},
		node_box = {
			type = "fixed",
			fixed = trunkbox,
		},
		selection_box = {
			type = "fixed",
			fixed = trunkbox,
		},
		paramtype = "light",
		paramtype2 = "facedir",
		climbable = true,
		is_ground_content = false,
		groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2, attached_node=1,},
		sounds = default.node_sound_wood_defaults(),
        -- @@@ Josselin2
        use_texture_alpha = "clip",         
	})


	minetest.register_node("aotearoa:"..treename.."_sapling", {
		description = sapdesc ..sci_name,
		drawtype = sapdraw,
		tiles = {sapimage},
        -- @@@ Josselin2
--		inventory_image = {sapimage},
		inventory_image = sapimage,
        -- @@@ Josselin2
        use_texture_alpha = "clip",         
		node_box = {
			type = "fixed",
			fixed = {sapbox,},
		},
		selection_box = {
			type = "fixed",
	        	fixed = {sapbox,},
        },
		paramtype = "light",
		paramtype2 = "waving",
		walkable = false,
		is_ground_content = true,
		groups = {snappy=2,dig_immediate=3,flammable=2,attached_node=1,sapling=1},
		sounds = default.node_sound_defaults(),
		on_timer = function(pos,elapsed)
			aotearoa.grow_tree_fern_sapling(pos, treename, "aotearoa:"..treename.."_tree")
		end,
		on_construct = function(pos)
			minetest.get_node_timer(pos):start(math.random(300, 1500))
		end,
		on_place = function(itemstack, placer, pointed_thing)
			itemstack = default.sapling_on_place(itemstack, placer, pointed_thing,
		"aotearoa:"..treename.."_sapling",
		-- minp, maxp to be checked, relative to sapling pos
		-- minp_relative.y = 1 because sapling pos has been checked
		{x = -2, y = 1, z = -2},
		{x = 2, y = 6, z = 2},
		-- maximum interval of interior volume check
		4)
	return itemstack
end,
	})


	-- tree fern crown
	minetest.register_node("aotearoa:"..treename.."_crown", {
		description = treedesc.. " Crown " ..sci_name,
		drawtype = "plantlike",
		visual_scale = crownscale,
		paramtype = "light",
		tiles = {"aotearoa_"..treename.."_crown.png"},
		inventory_image = "aotearoa_"..treename.."_crown.png",
		walkable = false,
		sunlight_propagates = true,
		groups = {snappy = 3, flammable = 2, leaves = 1, attached_node=1,},
		drop = {
			max_items = 1,
			items = {
				{items = {"aotearoa:"..treename.."_sapling"}, rarity = droprarity },
				{items = {"aotearoa:"..treename.."_crown"} }
			}
		},
		sounds = default.node_sound_leaves_defaults(),
		selection_box = {
			type = "fixed",
			fixed = crownbox,
		},
	})

	--anything with a special top trunk (e.g. leaf skirts)
	if skirt == "skirt" then
		local drop_skirt = nil
		--get the trunk if fern
		if treetype == "fern" then
			drop_skirt = "aotearoa:"..treename.."_tree"
		else
			drop_skirt = "aotearoa:"..treename.."_skirt"
		end

		minetest.register_node("aotearoa:"..treename.."_skirt", {
			description = treedesc.. "Top" ..sci_name,
			drawtype = "nodebox",
			tiles = {
				"aotearoa_"..treename.."_skirt_top.png",
				"aotearoa_"..treename.."_skirt_top.png",
				"aotearoa_"..treename.."_skirt.png"
			},
			node_box = {
				type = "fixed",
				fixed = {-1/3, -1/2, -1/3, 1/3, 1/2, 1/3},
			},
			selection_box = {
				type = "fixed",
				fixed = {-1/3, -1/2, -1/3, 1/3, 1/2, 1/3},
			},
			paramtype = "light",
			paramtype2 = "facedir",
			is_ground_content = false,
			groups = {tree = 1, choppy = 3, oddly_breakable_by_hand = 1, flammable = 2, attached_node=1},
			drop = drop_skirt,
			sounds = default.node_sound_wood_defaults(),
			--collapse tree when cut
			after_destruct = function(pos,oldnode)
				local node = minetest.get_node({x=pos.x,y=pos.y+1,z=pos.z})
				if node.name == "aotearoa:"..treename.."_tree" then
						minetest.dig_node({x=pos.x,y=pos.y+1,z=pos.z})
						--minetest.add_item(pos,"aotearoa:"..treename.."_tree")
				end
			end,
		})

	end

end


--------------------------------------------------------
--ODD BALLS
--Things that are just...mmmm.




-------------
--Raupo
minetest.register_node("aotearoa:raupo", {
	description = "Raupo\n".. minetest.colorize("#adaba0","(Typha orientalis)"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"aotearoa_raupo.png"},
	inventory_image = "aotearoa_raupo.png",
	wield_image = "aotearoa_raupo.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 1, dry_grass = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, 0.5, 0.1},
	},
	after_dig_node = function(pos, node, metadata, digger)
		aotearoa.dig_up(pos, {"aotearoa:raupo", "aotearoa:raupo_flower"}, digger)
	end,
})

minetest.register_craft({
	type = "fuel",
	recipe = "aotearoa:raupo",
	burntime = 1,
})

--raupo flower
minetest.register_node("aotearoa:raupo_flower", {
	description = "Raupo Flower\n".. minetest.colorize("#adaba0","(Typha orientalis)"),
	drawtype = "plantlike",
	waving = 1,
	tiles = {"aotearoa_raupo_flower.png"},
	inventory_image = "aotearoa_raupo_flower.png",
	wield_image = "aotearoa_raupo_flower.png",
	paramtype = "light",
	sunlight_propagates = true,
	walkable = false,
	buildable_to = true,
	groups = {snappy = 3, flammable = 1, dry_grass = 1},
	sounds = default.node_sound_leaves_defaults(),
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, 0.5, 0.1},
	},
})

minetest.register_craft({
	type = "fuel",
	recipe = "aotearoa:raupo_flower",
	burntime = 1,
})




-----------------------------
-- Pipi (shellfish)

minetest.register_node("aotearoa:pipi", {
	description = "Pipi\n".. minetest.colorize("#adaba0","(Paphies australis)"),
	drawtype = "plantlike",
	paramtype = "light",
	visual_scale = 0.6,
	tiles = {"aotearoa_pipi.png"},
	inventory_image = "aotearoa_pipi.png",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, -0.2, 0.1}
	},
	groups = {fleshy = 3, dig_immediate = 3},

	sounds = default.node_sound_gravel_defaults(),
	--rebury shellfish
	on_timer = function(pos)
		local below = {x = pos.x, y = pos.y - 1, z = pos.z}
			if minetest.get_node(below).name == "default:sand" then
				minetest.set_node(pos, {name = "air"})
				minetest.set_node(below, {name = "aotearoa:sand_with_pipi"})
			elseif minetest.get_node(below).name == "aotearoa:iron_sand" then
				minetest.set_node(pos, {name = "air"})
				minetest.set_node(below, {name = "aotearoa:iron_sand_with_pipi"})
			end
	end,
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(3, 5))
	end,
	--eat and get shells
	--on_use = minetest.item_eat(1,"aotearoa:seashells")
	on_use = minetest.item_eat(1)	
})

--pipi in sand
minetest.register_node("aotearoa:sand_with_pipi", {
	description = "Sand with Pipi",
	tiles = {"aotearoa_sand_with_pipi.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
	--dig up the shellfish
	on_punch = function(pos, node, puncher)
		puncher:get_inventory():add_item('main', "aotearoa:pipi")
		minetest.set_node(pos, {name = "default:sand"})
	end,
})

minetest.register_node("aotearoa:iron_sand_with_pipi", {
	description = "Iron-sand with Pipi",
	tiles = {"aotearoa_iron_sand_with_pipi.png"},
	groups = {crumbly = 3, falling_node = 1, sand = 1},
	sounds = default.node_sound_sand_defaults(),
	--dig up the shellfish
	on_punch = function(pos, node, puncher)
		puncher:get_inventory():add_item('main', "aotearoa:pipi")
		minetest.set_node(pos, {name = "aotearoa:iron_sand"})
	end,
})

-----------------------------
-- Cockle (shellfish)

minetest.register_node("aotearoa:cockle", {
	description = "Cockle\n".. minetest.colorize("#adaba0","(Austrovenus stutchburyi)"),
	drawtype = "plantlike",
	paramtype = "light",
	visual_scale = 0.6,
	tiles = {"aotearoa_cockle.png"},
	inventory_image = "aotearoa_cockle.png",
	sunlight_propagates = true,
	walkable = false,
	selection_box = {
		type = "fixed",
		fixed = {-0.1, -0.5, -0.1, 0.1, -0.2, 0.1}
	},
	groups = {fleshy = 3, dig_immediate = 3},

	sounds = default.node_sound_gravel_defaults(),
	--rebury shellfish
	on_timer = function(pos)
		local below = {x = pos.x, y = pos.y - 1, z = pos.z}
			if minetest.get_node(below).name == "aotearoa:mud" then
				minetest.set_node(pos, {name = "air"})
				minetest.set_node(below, {name = "aotearoa:mud_with_cockles"})
			end
	end,
	on_construct = function(pos)
		minetest.get_node_timer(pos):start(math.random(3, 5))
	end,
	--eat and get shells
	--on_use = minetest.item_eat(1,"aotearoa:seashells")
	on_use = minetest.item_eat(1)	
})

--cockle in mud
minetest.register_node("aotearoa:mud_with_cockles", {
	description = "Mud with Cockles",
	tiles = {"aotearoa_mud_with_cockles.png"},
	groups = {crumbly = 3, puts_out_fire = 1},
	sounds = default.node_sound_dirt_defaults({
		footstep = {name = "aotearoa_mud", gain = 0.4},
		dug = {name = "aotearoa_mud", gain = 0.4},
	}),
	--dig up the shellfish
	on_punch = function(pos, node, puncher)
		puncher:get_inventory():add_item('main', "aotearoa:cockle")
		minetest.set_node(pos, {name = "aotearoa:mud"})
	end,
})
