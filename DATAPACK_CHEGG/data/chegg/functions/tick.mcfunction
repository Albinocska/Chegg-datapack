

execute as @e[type=!player, nbt={HurtTime:10s}] run kill @s
execute as @e[type=minecraft:phantom] run data merge entity @s {Fire:0}
kill @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},nbt={Item:{id:"minecraft:acacia_button"}}]
