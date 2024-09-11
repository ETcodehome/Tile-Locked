# We summon a tile marker at the current location and then process the unlocked tile
execute as @s[tag=currentPlayer] align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags: [tilelocked, tileMarker, unlocked]}
execute as @e[type=marker,tag=tileMarker,tag=unlocked,distance=..1.1,sort=nearest,limit=1] at @s run function tilelocked:tile_init/init_unlocked_tile

# Add 1 to the amount of unlocked tiles
scoreboard players add Unlocked TileLockedData 1

# Remove XP/Level from player unlocking the tile
execute if score #difficulty TileLockedData matches 0 run xp add @a[tag=currentPlayer] -1
execute if score #difficulty TileLockedData matches 1 run xp add @a[tag=currentPlayer] -5
execute if score #difficulty TileLockedData matches 2 run xp add @a[tag=currentPlayer] -1 levels

# Play a noise
execute if score #unlockSound TileLockedData matches 1 at @a[tag=currentPlayer] run playsound minecraft:block.note_block.bell ambient @a[tag=currentPlayer]
