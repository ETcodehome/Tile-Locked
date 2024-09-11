## We will set our versions as padded 2 - 1.0.4 = 1 00 40 = 10040
# Run our load function again if version is less than 1.0.4
execute unless score #version TileLockedData matches 10040.. run function tilelocked:load
