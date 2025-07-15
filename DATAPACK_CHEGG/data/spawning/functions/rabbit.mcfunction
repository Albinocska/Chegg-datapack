function chegg:get_dir
execute if entity @p[advancements={chegg:rabbit=true},team=blue] run team join blue @e[type=rabbit,limit=1,sort=nearest]
execute if entity @p[advancements={chegg:rabbit=true},team=red] run team join red @e[type=rabbit,limit=1,sort=nearest]

execute if score #math blue_x > #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=rabbit,team=blue,sort=nearest,tag=!init] {Rotation:[90f,0f],Tags:["init"]}
execute if score #math blue_x < #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=rabbit,team=blue,sort=nearest,tag=!init] {Rotation:[-90f,0f],Tags:["init"]}
execute if score #math blue_x > #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=rabbit,team=red,sort=nearest,tag=!init] {Rotation:[-90f,0f],Tags:["init"]}
execute if score #math blue_x < #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=rabbit,team=red,sort=nearest,tag=!init] {Rotation:[90f,0f],Tags:["init"]}

execute if score #math blue_z > #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=rabbit,team=blue,sort=nearest,tag=!init] {Rotation:[180f,0f],Tags:["init"]}
execute if score #math blue_z < #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=rabbit,team=blue,sort=nearest,tag=!init] {Rotation:[0f,0f],Tags:["init"]}
execute if score #math blue_z > #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=rabbit,team=red,sort=nearest,tag=!init] {Rotation:[0f,0f],Tags:["init"]}
execute if score #math blue_z < #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=rabbit,team=red,sort=nearest,tag=!init] {Rotation:[-180f,0f],Tags:["init"]}
advancement revoke @p[advancements={chegg:rabbit=true},limit=1] only chegg:rabbit