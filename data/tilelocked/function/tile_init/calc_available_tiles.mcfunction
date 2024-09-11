execute if score #difficulty TileLockedData matches 0..1 store result score @s TileLockedData run data get entity @s XpTotal
execute if score #difficulty TileLockedData matches 1 run scoreboard players operation @s TileLockedData /= #cost5 TileLockedData
execute if score #difficulty TileLockedData matches 2 store result score @s TileLockedData run data get entity @s XpLevel
