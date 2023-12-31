# Summon a marker to represent the player's location on the same y-plane as
# our chunk markers. This allows us to perform distance checks in 2D.
#
# We generate chunk markers at a fixed y-position, vertically centered in the
# current dimension. We rely on the fact that all chunk markers in a given
# dimension have the same y-position.
#
# Dimension build limits (inclusive):
# -----------------------------------
#   Overworld:   -64 to 319
#   Nether:        0 to 127
#   End:           0 to 255
summon minecraft:marker ~ 64 ~ {Tags: [tileman, player2d, currentPlayer]}

# Tag the current player for use within this function
tag @s add currentPlayer

# Update our available tiles
function tileman:tile_availability/calc_available_tiles

# Mark tile as unlocked if player has no tiles unlocked in close by (no loaded chunks, different dimension)
execute as @e[type=marker,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=unlocked,distance=-0..] if loaded ~ ~ ~ run function tileman:tile_init/init_tile

# If no tile marker is nearby, we need to unlock one or teleport the player back to the nearest unlocked tile
#   ("Nearby" means within 0.71 distance, corner of block is about 0.707 away from the center)
execute if score @s TilemanData matches ..0 at @e[type=marker,tag=player2d,tag=currentPlayer] unless entity @e[type=marker,tag=unlocked,distance=..0.71] at @s positioned ~ ~-1 ~ as @e[type=minecraft:block_display,tag=tileman,distance=0..,sort=nearest,limit=1] at @e[type=minecraft:block_display,tag=tileman,distance=0..,sort=nearest,limit=1] run teleport @p[tag=currentPlayer] ~ ~1 ~
execute if score @s TilemanData matches 1.. as @e[type=marker,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=unlocked,distance=..0.71] if loaded ~ ~ ~ run function tileman:tile_init/init_tile

# Remove temporary tag so that it can be used by the next player
tag @e[type=marker,tag=player2d,tag=currentPlayer] remove currentPlayer
tag @s remove currentPlayer
