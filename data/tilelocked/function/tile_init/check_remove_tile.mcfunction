#Remove if tile not on block or is under a block
execute as @e[type=block_display,tag=tilelocked,distance=..10] at @s unless block ~ ~ ~ #tilelocked:opaque run kill @s
execute as @e[type=block_display,tag=tilelocked,distance=..10] at @s if block ~ ~1 ~ #tilelocked:opaque run kill @s
