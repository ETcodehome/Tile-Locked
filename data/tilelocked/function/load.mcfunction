# Create scoreboards
scoreboard objectives add TileLockedXp dummy
scoreboard objectives add TileLockedLevel dummy
scoreboard objectives add Uuid1 dummy
scoreboard objectives add Uuid2 dummy
scoreboard objectives add Uuid3 dummy
scoreboard objectives add Uuid4 dummy

# Scoreboards for tracking tile unlocking
scoreboard objectives add TileLockedData dummy
scoreboard objectives setdisplay list TileLockedData
scoreboard objectives modify TileLockedData displayname "=== Tile Locked ==="
execute unless score #difficulty TileLockedData matches 0.. run scoreboard players set #difficulty TileLockedData 0
execute unless score #unlockSound TileLockedData matches 0.. run scoreboard players set #unlockSound TileLockedData 1
execute unless score Unlocked TileLockedData matches 0.. run scoreboard players set Unlocked TileLockedData 0
execute unless score #cost5 TileLockedData matches 5 run scoreboard players set #cost5 TileLockedData 5
execute unless score #ticks TileLockedData matches 0.. run scoreboard players set #ticks TileLockedData 0
execute unless score #tileColor TileLockedData matches 0.. run scoreboard players set #tileColor TileLockedData 9
execute unless score #version TileLockedData matches 0.. run scoreboard players set #version TileLockedData 1
scoreboard objectives setdisplay sidebar TileLockedData

# Scoreboard for trigger commands
scoreboard objectives add TileLockedSettings trigger

# Force players to spawn around a single block to prevent spawning outside an unlocked tile
gamerule spawnRadius 0
gamerule keepInventory true
