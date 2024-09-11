# Tick our players
execute as @a[gamemode=!spectator] at @s run function tilelocked:post_tick_player

# Kill our 2d player markers
kill @e[type=marker,tag=tilelocked,tag=player2d]

# Update tile colors if needed
execute if score #tileColor TileLockedData matches 0 as @e[type=block_display,tag=tilelocked,tag=!color0] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 1 as @e[type=block_display,tag=tilelocked,tag=!color1] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 2 as @e[type=block_display,tag=tilelocked,tag=!color2] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 3 as @e[type=block_display,tag=tilelocked,tag=!color3] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 4 as @e[type=block_display,tag=tilelocked,tag=!color4] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 5 as @e[type=block_display,tag=tilelocked,tag=!color5] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 6 as @e[type=block_display,tag=tilelocked,tag=!color6] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 7 as @e[type=block_display,tag=tilelocked,tag=!color7] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 8 as @e[type=block_display,tag=tilelocked,tag=!color8] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 9 as @e[type=block_display,tag=tilelocked,tag=!color9] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 10 as @e[type=block_display,tag=tilelocked,tag=!color10] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 11 as @e[type=block_display,tag=tilelocked,tag=!color11] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 12 as @e[type=block_display,tag=tilelocked,tag=!color12] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 13 as @e[type=block_display,tag=tilelocked,tag=!color13] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 14 as @e[type=block_display,tag=tilelocked,tag=!color14] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 15 as @e[type=block_display,tag=tilelocked,tag=!color15] run function tilelocked:tile_init/check_color
execute if score #tileColor TileLockedData matches 16 as @e[type=block_display,tag=tilelocked,tag=!color16] run function tilelocked:tile_init/check_color

# Reset our ticking counters
execute if score #ticks TileLockedData matches 10.. run scoreboard players set #ticks TileLockedData 0
