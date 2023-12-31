# We summon a tile marker at the current location and then process the unlocked tile
# Players spawn tiles are unlocked by default.
execute as @s[tag=currentPlayer] align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags: [tilelocked, tileMarker, unlocked]}
execute as @e[type=marker,tag=tileMarker,tag=unlocked,distance=..1.1,sort=nearest,limit=1] at @s run function tilelocked:tile_init/init_unlocked_tile
