execute as @e[type=!minecraft:player,nbt=!{NoAI:true}] run data modify entity @s CustomName set from entity @s "Type"
execute as @e[type=!minecraft:player,nbt=!{NoAI:true}] run data merge entity @s {NoAI:true,CustomNameVisible:true,ArmorItems:[{},{},{},{Count:1,id:"acacia_button"}],PersistenceRequired:1b,ArmorDropChances:[0,0,0,0],Silent:1b}
execute as @e[type=villager,tag=!king] run data modify entity @s Tags set value ["king"]
execute as @e[type=!player, nbt={HurtTime:10s}] run kill @s
kill @e[type=item,nbt={Item:{id:"minecraft:nether_star"}}]
