execute as @e[type=!minecraft:player,nbt=!{NoAI:true},type=!armor_stand] run data modify entity @s CustomName set from entity @s "Type"
execute as @e[type=!minecraft:player,nbt=!{NoAI:true},type=!armor_stand] run data merge entity @s {NoAI:true,CustomNameVisible:true,ArmorItems:[{},{},{},{Count:1,id:"acacia_button"}],PersistenceRequired:1b,ArmorDropChances:[0,0,0,0],Silent:1b}
execute as @e[type=!player, nbt={HurtTime:10s}] run kill @s
execute as @e[type=minecraft:phantom] run data merge entity @s {Fire:0}
kill @e[type=item,nbt={Item:{id:"minecraft:nether_star"}},nbt={Item:{id:"minecraft:acacia_button"}}]
