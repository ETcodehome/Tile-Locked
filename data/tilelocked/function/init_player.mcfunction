# Store player's UUID
execute store result score @s Uuid1 run data get entity @s UUID[0]
execute store result score @s Uuid2 run data get entity @s UUID[1]
execute store result score @s Uuid3 run data get entity @s UUID[2]
execute store result score @s Uuid4 run data get entity @s UUID[3]

# Enable trigger commands for this player
scoreboard players enable @s TileLockedSettings

tag @s add playerInitTileLocked
