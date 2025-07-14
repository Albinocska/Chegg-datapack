execute as @e[type=!minecraft:player,nbt=!{NoAI:true},type=!armor_stand] run data modify entity @s CustomName set from entity @s "Type"
execute as @e[type=!minecraft:player,nbt=!{NoAI:true},type=!armor_stand] run data merge entity @s {NoAI:true,CustomNameVisible:true,ArmorItems:[{},{},{},{Count:1,id:"acacia_button"}],PersistenceRequired:1b,ArmorDropChances:[0,0,0,0],Silent:1b}
execute as @e[type=villager,tag=!king] run data modify entity @s Tags set value ["king"]
execute as @e[type=!player, nbt={HurtTime:10s}] run kill @s
execute at @a[team=blue] run teleport @e[tag=blue_detector] ~ ~ ~
execute at @a[team=red] run teleport @e[tag=red_detector] ~ ~ ~
execute as @e[type=armor_stand,nbt=!{HandItems:[{},{}]}] run function chegg:wrapper
kill @e[type=item,nbt={Item:{id:"minecraft:nether_star"}}]
