# generate markers at a specific y-position so other markers can all remain relative
summon minecraft:marker ~ 64 ~ {Tags: [tilelocked, player2d, currentPlayer]}

# Tag the current player for use within this function
tag @s add currentPlayer

# Update our available tiles
function tilelocked:tile_init/calc_available_tiles

# Mark tile as unlocked if player has no tiles unlocked close by (no loaded chunks or different dimension)
execute as @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=-0..] if loaded ~ ~ ~ run function tilelocked:tile_init/init_tile

# If no tile marker is nearby, we need to unlock a tile or teleport the player back to within the tile limits (within 0.71 distance, corner of block is about 0.707 away from the center)
# if no available tiles, player within 3 blocks from last good position teleport back there
execute if score @s TileLockedData matches ..0 at @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.71] if entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..3] at @s as @e[tag=tilelocked,tag=prevPosMarker,sort=nearest,limit=1] at @s run function tilelocked:tile_init/teleport_player_back
# if no available tiles, player further than 3 blocks from last good position teleport to middle of nearest tile
execute if score @s TileLockedData matches ..0 at @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.71] unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..3] at @s positioned ~ ~-1 ~ as @e[type=block_display,tag=tilelocked,distance=0..,sort=nearest,limit=1] at @s run teleport @a[tag=currentPlayer] ~ ~1 ~
# if has available tile, unlock the new tile
execute if score @s TileLockedData matches 1.. as @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.71] if loaded ~ ~ ~ run function tilelocked:tile_init/init_tile

# Remove temporary tag so that it can be used by the next player
tag @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] remove currentPlayer
tag @s remove currentPlayer
