# generate markers at a specific y-position so other markers can all remain relative
summon minecraft:marker ~ 64 ~ {Tags: [tilelocked, player2d, currentPlayer]}

# Tag the current player for use within this function
tag @s add currentPlayer

# Mark tile as unlocked if player has no tiles unlocked close by (no loaded chunks or different dimension)
execute as @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=-0..] if loaded ~ ~ ~ run function tilelocked:tile_init/init_tile


# Add tiles earned from time played
function tilelocked:tile_init/calc_available_tiles


# Now we unlock blocks if the player has the necessary prerequisite
# each successive clause won't run if the previous clause succeeded as the unless clause triggers from the instantiated marker entity

# Consume earned tiles first to unlock tile if possible
execute if score @s TileLockedData matches 1.. as @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.7072] if loaded ~ ~ ~ run function tilelocked:tile_init/init_tile

# if difficulty 0 consume 1 player xp to unlock the tile if possible
execute if score #difficulty TileLockedData matches 0 store result score @s TileAvailableXP run data get entity @s XpTotal
execute if score @s TileAvailableXP matches 1.. as @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.7072] if loaded ~ ~ ~ run function tilelocked:tile_init/init_tile_xp

# if difficulty 1 consume 5 player xp to unlock the tile if possible
execute if score #difficulty TileLockedData matches 1 store result score @s TileAvailableXP run data get entity @s XpTotal
# weirdly, the 5.. check fails unreliably if we don't zero out the availablexp score first (valid at 1.21.1)
execute if score @s TileAvailableXP matches ..4 run scoreboard players set @s TileAvailableXP 0
execute if score @s TileAvailableXP matches 5.. as @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.7072] if loaded ~ ~ ~ run function tilelocked:tile_init/init_tile_xp

# if difficulty 2 consume 1 level to unlock the tile if possible
execute if score #difficulty TileLockedData matches 2 store result score @s TileAvailableXP run data get entity @s XpLevel
execute if score @s TileAvailableXP matches 1.. as @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] at @s unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.7072] if loaded ~ ~ ~ run function tilelocked:tile_init/init_tile_xp


# If no tile marker is nearby, we need to unlock a tile or teleport the player back to within the tile limits (within 0.71 distance, corner of block is about 0.70711 away from the center)
# Ideally we would not use this method as it essentially allows a circle around each tiles centre of radius 0.70711
# This leaves 0.70711 (radius) - 0.5 (half a block) = 0.20711 (overlap) on adjacent unclaimed blocks at the middle of the arc which is large enough to stand on without triggering a reset.

# if no available tiles, player within 3 blocks from last good position teleport back there
execute if score @s TileLockedData matches ..0 at @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.7072] if entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..3] at @s as @e[tag=tilelocked,tag=prevPosMarker,sort=nearest,limit=1] at @s run function tilelocked:tile_init/teleport_player_back

# if no available tiles, player further than 3 blocks from last good position teleport to middle of nearest tile
execute if score @s TileLockedData matches ..0 at @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..0.7072] unless entity @e[type=marker,tag=tilelocked,tag=unlocked,distance=..3] at @s positioned ~ ~-1 ~ as @e[type=block_display,tag=tilelocked,distance=0..,sort=nearest,limit=1] at @s run teleport @a[tag=currentPlayer] ~ ~1 ~

# Remove temporary tag so that it can be used by the next player
tag @e[type=marker,tag=tilelocked,tag=player2d,tag=currentPlayer] remove currentPlayer
tag @s remove currentPlayer
