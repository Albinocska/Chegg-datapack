function chegg:get_dir
execute if entity @p[advancements={chegg:phantom=true},team=blue] run team join blue @e[type=phantom,limit=1,sort=nearest]
execute if entity @p[advancements={chegg:phantom=true},team=red] run team join red @e[type=phantom,limit=1,sort=nearest]

execute if score #math blue_x > #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=phantom,team=blue,sort=nearest,tag=!init] {Rotation:[90f,0f]}
execute if score #math blue_x < #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=phantom,team=blue,sort=nearest,tag=!init] {Rotation:[-90f,0f]}
execute if score #math blue_x > #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=phantom,team=red,sort=nearest,tag=!init] {Rotation:[-90f,0f]}
execute if score #math blue_x < #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=phantom,team=red,sort=nearest,tag=!init] {Rotation:[90f,0f]}

execute if score #math blue_z > #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=phantom,team=blue,sort=nearest,tag=!init] {Rotation:[180f,0f]}
execute if score #math blue_z < #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=phantom,team=blue,sort=nearest,tag=!init] {Rotation:[0f,0f]}
execute if score #math blue_z > #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=phantom,team=red,sort=nearest,tag=!init] {Rotation:[0f,0f]}
execute if score #math blue_z < #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=phantom,team=red,sort=nearest,tag=!init] {Rotation:[-180f,0f]}

execute as @e[type=minecraft:phantom,tag=!init] run data modify entity @s CustomName set from entity @s "Type"
execute as @e[type=minecraft:phantom,tag=!init] run data merge entity @s {NoAI:true,CustomNameVisible:true,ArmorItems:[{},{},{},{Count:1,id:"acacia_button"}],PersistenceRequired:1b,ArmorDropChances:[0,0,0,0],Silent:1b,IsBaby:0b}


execute as @e[sort=nearest,type=minecraft:phantom,tag=!init,limit=1] run tag @s add init


advancement revoke @p[advancements={chegg:phantom=true},limit=1] only chegg:phantom