# Teleport the player back to their last good position within tile limits
execute as @e[tag=tilelocked,tag=prevPosMarker,sort=nearest,limit=1] rotated as @a[tag=currentPlayer] positioned as @s run tp @s ~ ~ ~ ~ ~
teleport @a[tag=currentPlayer] @e[tag=tilelocked,tag=prevPosMarker,sort=nearest,limit=1]
title @a[tag=currentPlayer] actionbar {"color":"red","text":"Can't Unlock!"}
