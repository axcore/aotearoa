# Aotearoa REDO

Original mod created by Dokimi, updated for Minetest v5.5.1 by Josselin2.

![Screenshot](screenshot.png)

As of 10 July 2022, the original version of this mod produces a number of annoying errors/warnings on Minetest v5.5.1. I have updated the code to fix them.

All changes are preceded by '@@@ Josselin2':

*blocks.lua*

Removed duplicate .tiles filed in aotearoa:gumland_soil

The cooking recipe for aotearoa:coquina_limestone uses default:coral, which does not exist. Replaced it with default:coral_orange

*depends.txt*

Incorporated into *mod.conf*, then deleted

*description.txt*

Incorporated into *mod.conf*, then deleted

*crafting.lua*

The ponga fence has been given 'use_texture_alpha = "clip"'

*node_defs.lua*

Fixed invalid values for the inventory image in various generic sapling functions

Some items have been given 'use_texture_alpha = "clip"'

*mapgen.lua*

Fixed typos in variable names used in the Southern Estuary biome

Fixed typo in "east_coast_north ocean" biome (should be east_coast_north_ocean"). Did NOT update the "Aotearoa (New Zealand) v0.2_dev.mt" or "Biome_Guide.txt" files

Did NOT fix the spelling of "north_cook_straight" and "south_cook_straight" biomes for backwards compatibility (should be "strait")

In the peat bog biome, fixed invalid "aotearoa:_peat"

*node_defa.lua*

minetest.register_node() is called twice for the same plants. Fixed

*ores.lua*

Replaced "basalt" with "aotearoa:basalt" in a couple of places

*README.md*

Made the screenshot explicitly visible in this document.

The rest of this file comprises the original README text.

*trees.lua*

minetest.place_schematic() calls were all broken; replaced the broken argument with "random"
Schematic offsets for mangrove trees should be {7, 1, 7} not {2, 1, 2}; fixed

# Instructions:
Designed for use with mg_valleys.

(Will work with other default mapgens but may not display well. )


# License:

Code is licensed under GNU LGPLv2+.

Textures are licensed under CC BY-SA 3.0 Unported.

# Credit:
NZ birdsongs adapted from New Zealand Department of Conservation. CC BY 4.0
https://www.doc.govt.nz/nature/native-animals/birds/bird-songs-and-calls/
(bellbirds, tuis, kokako, parakeet, si_kaka, tuis2, tuis3, tuis4, silvereye, fantail1, grey_warbler, ni_robin, si_robin, cicada_kereru, whitehead, kea, takahe, morepork, male_kiwi, female_kiwi, kakapo, shearwater, yellow_eyed_penguin)

boiling_mud sound adapted from Bubbling Cauldron, Mike Koenig , http://soundbible.com/51-Bubbling-Cauldron.html

mud footstep sounds (http://www.freesound.org/people/dobroide/sounds/16771) copyright (C) 2006 by dobroide, [CC by 3.0]

te_kore_whakapapa adapted from https://teara.govt.nz/en/speech/30768/te-kore-whakapapa  Creative Commons Attribution-NonCommercial 3.0 New Zealand Licence. See below for text and translation.

# Changelog:

# 0.1
- Initial release

# 0.2
- Adjust Subantarctic, Raupo, gumland, and Coastal volcanic biomes.
- New plant class: woody bushes.
- New rocks: Andesite, Granite, Greywacke, Gneiss, Basalt, Scoria
- Replace default sandstones with aotearoa versions
- New Ores: limonite (iron), Cassiterite (tin), Chalcopyrite (copper).
- Ocean/Basement rock biomes
- Green Shovel (by Parasite)
- leaves can be walked through, large trees can't be cut by hand, stone axe craftable with gravel
- Fiordland Forest biome (with new Silver Beech, Crown Fern, and Dirt with Beech litter)
- Split off new biomes from Northern and Southern podocarps, including new trees and dirt with dry litter (Tawa, Hinau, Beech, Black Maire Forests)
- Split fernland into: manuka scrub, broadleaf scrub, geothermal scrub
- Salt marsh (with new sea rush), and Southern estuary biomes
- Fen biome
- Volcanic field biome
- Some new leaf textures to (hopefully) improve performance
- Sea life: pipi, cockles
- revised cooking of tree seeds: seed meal -> seed cake.
- Many other minor additions, fixes, and adjustments



# Te Kore Whakapapa:
The Geneaology of Creation:

I te timatanga Te Kore.
Te Kore.
Te Kore-te-whiwhia.
Te Kore-te-rawea.
Te Kore-i-ai.
Te Kore-te-wiwia.

Te Kore Te Po.
Te Po-nui.
Te Po-roa.
Te Po-uriuri.
Te Po-kerekere.
Te Po-tiwhatiwha.
Te Po-te-kitea.
Te Po-tangotango.
Te Po-whawha.
Te Po-namunamu-ki-taiao.
Te Po-tahuri-atu.
Te Po-tahuri-mai-ki-taiao.

Te Whai-ao.
Te Ao-marama.
Tihei mauri-ora.


In the beginning was the Void.
The Void.
The Void in which nothing is possessed.
The Void in which nothing is felt.
The Void with nothing in union.
The Void without boundaries.

From the void the Night.
The great Night.
The long Night.
The deep Night.
The intense Night.
The dark Night.
The Night in which nothing is seen.
The intensely dark Night.
The Night of feeling.
The Night of seeking the passage to the world.
The Night of restless turning.
The Night of turning towards the revealed world.

The glimmer of dawn.
The bright light of day.
There is life.




