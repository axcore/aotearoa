local random = math.random

-----------------
-- Grow trees from saplings
--
--make sure each tree has 2 schems, and schem name is e.g. Treename1


-- Grow sapling

function aotearoa.grow_sapling(pos, treename, stem)
	if not default.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	else
		--remove sapling.
		minetest.set_node(pos, {name = stem})

		--correct position for placing based on which schem is used
		--large trees that all use 15x15
		pos = {x = pos.x - 7, y = pos.y-1, z = pos.z - 7}

		--place schematic
		local chance = random(1,2)
        -- @@@ Josselin2
        --[[
		if chance == 1 then
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."1"..".mts", random, "", false)
		else
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."2"..".mts", random, "", false)
		end
        ]]--
		if chance == 1 then
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."1"..".mts", "random", "", false)
		else
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."2"..".mts", "random", "", false)
		end
	end
end

---------------------------
-- Grow SHRUB sapling

function aotearoa.grow_shrub_sapling(pos, treename, stem)
	if not default.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	else
		--remove sapling.
		minetest.set_node(pos, {name = stem})

		--correct position for placing based on which schem is used
		--shrubs use 5x5

        -- @@@ Josselin2 - schematic offsets for mangrove trees are wrong
--		pos = {x = pos.x - 2, y = pos.y-1, z = pos.z - 2}
        if treename == "mangrove" then
            pos = {x = pos.x - 7, y = pos.y-1, z = pos.z - 7}
        else
            pos = {x = pos.x - 2, y = pos.y-1, z = pos.z - 2}
        end

		--place schematic
		local chance = random(1,2)
        -- @@@ Josselin2
        --[[
		if chance == 1 then
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."1"..".mts", random, "", false)
		else
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."2"..".mts", random, "", false)
		end
        ]]--
		if chance == 1 then
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."1"..".mts", "random", "", false)
		else
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."2"..".mts", "random", "", false)
		end
	end
end



---------------------------
-- Grow BUSH sapling

function aotearoa.grow_bush_sapling(pos, treename, stem)
	if not default.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	else
		--remove sapling.
		minetest.set_node(pos, {name = stem})

		--correct position for placing based on which schem is used
		--bushes use 3x3

		pos = {x = pos.x - 1, y = pos.y-1, z = pos.z - 1}

		--place schematic
		local chance = random(1,2)
        -- @@@ Josselin2
        --[[
		if chance == 1 then
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."1"..".mts", random, "", false)
		else
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."2"..".mts", random, "", false)
		end
        ]]--
		if chance == 1 then
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."1"..".mts", "random", "", false)
		else
			minetest.place_schematic(pos, aotearoa.path.. "/schematics/"..treename.."2"..".mts", "random", "", false)
		end
	end
end


----------------------------------
-- Grow TREE FERN sapling (also palm style)



function aotearoa.grow_tree_fern_sapling(pos, treename, stem)
	if not default.can_grow(pos) then
		-- try again 5 min later
		minetest.get_node_timer(pos):start(300)
		return
	else
		--remove sapling.
		minetest.set_node(pos, {name = stem})

		--place schematic from schematics file
		local chance = random(1,2)
		local schem = nil
		if chance == 1 then
			minetest.place_schematic(pos, aotearoa[treename.."1"])
		else
			minetest.place_schematic(pos, aotearoa[treename.."2"])
		end
	end
end
