#1. get the color of the player
#2. calculate position
#3. select facing
execute facing entity @p[tag=!init,team=blue] eyes run summon zombie ^ ^ ^
execute if score #math blue_x > #math red_x run data merge entity @e[limit=1,type=zombie,team=blue,sort=nearest] {Rotation:[90,0],Tags:["init"]}
execute if score #math blue_x < #math red_x run data merge entity @e[limit=1,type=zombie,team=blue,sort=nearest] {Rotation:[-90,0],Tags:["init"]}


