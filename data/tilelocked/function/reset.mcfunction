kill @e[tag=tilelocked]
execute in minecraft:overworld run kill @e[tag=tilelocked]
execute in minecraft:the_end run kill @e[tag=tilelocked]
execute in minecraft:the_nether run kill @e[tag=tilelocked]
scoreboard players reset Unlocked TileLockedData
function tilelocked:load
