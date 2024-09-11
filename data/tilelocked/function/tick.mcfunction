# Initialize new players
execute as @a[tag=!playerInitTileLocked] run function tilelocked:init_player

# Tick players
execute as @a[gamemode=!spectator] at @s run function tilelocked:tick_player

# Enable trigger commands for this player
scoreboard players enable @a TileLockedSettings
