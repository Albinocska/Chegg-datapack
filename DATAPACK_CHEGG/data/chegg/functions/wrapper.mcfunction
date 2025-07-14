function chegg:get_dir
execute as @e[tag=blue_detector,nbt={HandItems:[{id:"minecraft:zombie_spawn_egg"},{}]}] run function spawning:zombie_blue
execute as @e[type=armor_stand,nbt=!{HandItems:[{},{}]}] run data merge entity @s {HandItems:[{},{}]}