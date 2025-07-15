function chegg:get_dir
execute if entity @p[advancements={chegg:slime=true},team=blue] run team join blue @e[type=slime,limit=1,sort=nearest]
execute if entity @p[advancements={chegg:slime=true},team=red] run team join red @e[type=slime,limit=1,sort=nearest]

execute if score #math blue_x > #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=slime,team=blue,sort=nearest,tag=!init] {Rotation:[90f,0f],Tags:["init"],Size:0}
execute if score #math blue_x < #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=slime,team=blue,sort=nearest,tag=!init] {Rotation:[-90f,0f],Tags:["init"],Size:0}
execute if score #math blue_x > #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=slime,team=red,sort=nearest,tag=!init] {Rotation:[-90f,0f],Tags:["init"],Size:0}
execute if score #math blue_x < #math red_x if score #math diff_x > #math diff_z run data merge entity @e[limit=1,type=slime,team=red,sort=nearest,tag=!init] {Rotation:[90f,0f],Tags:["init"],Size:0}

execute if score #math blue_z > #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=slime,team=blue,sort=nearest,tag=!init] {Rotation:[180f,0f],Tags:["init"],Size:0}
execute if score #math blue_z < #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=slime,team=blue,sort=nearest,tag=!init] {Rotation:[0f,0f],Tags:["init"],Size:0}
execute if score #math blue_z > #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=slime,team=red,sort=nearest,tag=!init] {Rotation:[0f,0f],Tags:["init"],Size:0}
execute if score #math blue_z < #math red_z if score #math diff_z > #math diff_x run data merge entity @e[limit=1,type=slime,team=red,sort=nearest,tag=!init] {Rotation:[-180f,0f],Tags:["init"],Size:0}
advancement revoke @p[advancements={chegg:slime=true},limit=1] only chegg:slime