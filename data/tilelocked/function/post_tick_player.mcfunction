# Tag the current player for use within this function
tag @s add currentPlayer

# Save players last good position for teleporting back to tiles
execute positioned ~ 64 ~ if entity @e[type=marker,tag=unlocked,distance=..0.71] at @s as @e[tag=tilelocked,tag=prevPosMarker] if score @s Uuid1 = @a[tag=currentPlayer,limit=1] Uuid1 if score @s Uuid2 = @a[tag=currentPlayer,limit=1] Uuid2 if score @s Uuid3 = @a[tag=currentPlayer,limit=1] Uuid3 if score @s Uuid4 = @a[tag=currentPlayer,limit=1] Uuid4 run kill @s
execute positioned ~ 64 ~ if entity @e[type=marker,tag=unlocked,distance=..0.71] at @s run summon minecraft:marker ^ ^ ^ {Tags: [tilelocked, prevPosMarker, markerNeedsInit]}

# Associate the marker with the current player.
execute store result score @e[tag=prevPosMarker,tag=markerNeedsInit,limit=1] Uuid1 run data get entity @s UUID[0]
execute store result score @e[tag=prevPosMarker,tag=markerNeedsInit,limit=1] Uuid2 run data get entity @s UUID[1]
execute store result score @e[tag=prevPosMarker,tag=markerNeedsInit,limit=1] Uuid3 run data get entity @s UUID[2]
execute store result score @e[tag=prevPosMarker,tag=markerNeedsInit,limit=1] Uuid4 run data get entity @s UUID[3]

# Check if we need to add or remove tiles around the player
execute if score #ticks TileLockedData matches 10.. at @s run function tilelocked:tile_init/check_remove_tile
execute if score #ticks TileLockedData matches 10.. at @s run function tilelocked:tile_init/check_add_tile

# Clean up
tag @s remove currentPlayer
tag @e[tag=markerNeedsInit] remove markerNeedsInit
