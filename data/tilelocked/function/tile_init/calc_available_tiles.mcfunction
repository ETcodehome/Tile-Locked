
# Make tile gains playtime based 
scoreboard players add @s TileTicks 1
execute if score @s TileTicks matches 600.. run scoreboard players add @s TileLockedData 1
execute if score @s TileTicks matches 600.. run title @s actionbar {"color":"gold","text":"+1 Tile (Time)"}
execute if score @s TileTicks matches 600.. run scoreboard players remove @s TileTicks 600 
