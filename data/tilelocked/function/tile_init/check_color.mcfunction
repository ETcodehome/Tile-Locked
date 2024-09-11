# Clear any color tags
tag @s remove color0
tag @s remove color1
tag @s remove color2
tag @s remove color3
tag @s remove color4
tag @s remove color5
tag @s remove color6
tag @s remove color7
tag @s remove color8
tag @s remove color9
tag @s remove color10
tag @s remove color11
tag @s remove color12
tag @s remove color13
tag @s remove color14
tag @s remove color15
tag @s remove color16

# Update our tile tag and color
execute if score #tileColor TileLockedData matches 0 run data modify entity @s block_state.Name set value "glass"
execute if score #tileColor TileLockedData matches 0 run tag @s add color0
execute if score #tileColor TileLockedData matches 1 run data modify entity @s block_state.Name set value "white_stained_glass"
execute if score #tileColor TileLockedData matches 1 run tag @s add color1
execute if score #tileColor TileLockedData matches 2 run data modify entity @s block_state.Name set value "light_gray_stained_glass"
execute if score #tileColor TileLockedData matches 2 run tag @s add color2
execute if score #tileColor TileLockedData matches 3 run data modify entity @s block_state.Name set value "gray_stained_glass"
execute if score #tileColor TileLockedData matches 3 run tag @s add color3
execute if score #tileColor TileLockedData matches 4 run data modify entity @s block_state.Name set value "black_stained_glass"
execute if score #tileColor TileLockedData matches 4 run tag @s add color4
execute if score #tileColor TileLockedData matches 5 run data modify entity @s block_state.Name set value "brown_stained_glass"
execute if score #tileColor TileLockedData matches 5 run tag @s add color5
execute if score #tileColor TileLockedData matches 6 run data modify entity @s block_state.Name set value "red_stained_glass"
execute if score #tileColor TileLockedData matches 6 run tag @s add color6
execute if score #tileColor TileLockedData matches 7 run data modify entity @s block_state.Name set value "orange_stained_glass"
execute if score #tileColor TileLockedData matches 7 run tag @s add color7
execute if score #tileColor TileLockedData matches 8 run data modify entity @s block_state.Name set value "yellow_stained_glass"
execute if score #tileColor TileLockedData matches 8 run tag @s add color8
execute if score #tileColor TileLockedData matches 9 run data modify entity @s block_state.Name set value "lime_stained_glass"
execute if score #tileColor TileLockedData matches 9 run tag @s add color9
execute if score #tileColor TileLockedData matches 10 run data modify entity @s block_state.Name set value "green_stained_glass"
execute if score #tileColor TileLockedData matches 10 run tag @s add color10
execute if score #tileColor TileLockedData matches 11 run data modify entity @s block_state.Name set value "cyan_stained_glass"
execute if score #tileColor TileLockedData matches 11 run tag @s add color11
execute if score #tileColor TileLockedData matches 12 run data modify entity @s block_state.Name set value "light_blue_stained_glass"
execute if score #tileColor TileLockedData matches 12 run tag @s add color12
execute if score #tileColor TileLockedData matches 13 run data modify entity @s block_state.Name set value "blue_stained_glass"
execute if score #tileColor TileLockedData matches 13 run tag @s add color13
execute if score #tileColor TileLockedData matches 14 run data modify entity @s block_state.Name set value "purple_stained_glass"
execute if score #tileColor TileLockedData matches 14 run tag @s add color14
execute if score #tileColor TileLockedData matches 15 run data modify entity @s block_state.Name set value "magenta_stained_glass"
execute if score #tileColor TileLockedData matches 15 run tag @s add color15
execute if score #tileColor TileLockedData matches 16 run data modify entity @s block_state.Name set value "pink_stained_glass"
execute if score #tileColor TileLockedData matches 16 run tag @s add color16
