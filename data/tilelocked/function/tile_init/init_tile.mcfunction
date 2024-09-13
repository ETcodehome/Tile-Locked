# We summon a tile marker at the current location and then process the unlocked tile
execute as @s[tag=currentPlayer] align xyz positioned ~0.5 ~ ~0.5 run summon minecraft:marker ~ ~ ~ {Tags: [tilelocked, tileMarker, unlocked]}
execute as @e[type=marker,tag=tileMarker,tag=unlocked,distance=..1.1,sort=nearest,limit=1] at @s run function tilelocked:tile_init/init_unlocked_tile

# Add 1 to the amount of unlocked tiles
scoreboard players add Unlocked TileLockedData 1

# Remove one tile from player
scoreboard players remove @a[tag=currentPlayer] TileLockedData 1
execute if score #unlockTexts TileLockedData matches 1 run title @a[tag=currentPlayer] actionbar {"color":"gold","text":"Tile Unlocked!"}

# Play a noise
execute if score #unlockSound TileLockedData matches 1 at @a[tag=currentPlayer] run playsound minecraft:block.note_block.bell ambient @a[tag=currentPlayer]
