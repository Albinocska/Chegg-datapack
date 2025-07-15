scoreboard objectives add blue_x dummy
scoreboard objectives add blue_z dummy
scoreboard objectives add red_x dummy
scoreboard objectives add red_z dummy
scoreboard objectives add diff_z dummy
scoreboard objectives add diff_x dummy
scoreboard objectives add negate dummy
scoreboard players set #math negate -1
execute as @e[tag=king,team=blue] store result score #math blue_z run data get entity @s Pos[2]
execute as @e[tag=king,team=blue] store result score #math blue_x run data get entity @s Pos[0]
execute as @e[tag=king,team=red] store result score #math red_z run data get entity @s Pos[2]
execute as @e[tag=king,team=red] store result score #math red_x run data get entity @s Pos[0]
scoreboard players operation #math diff_x += #math blue_x
scoreboard players operation #math diff_x -= #math red_x
scoreboard players operation #math diff_z += #math blue_z
scoreboard players operation #math diff_z -= #math red_z
execute if score #math diff_x matches ..0 run scoreboard players operation #math diff_x *= #math negate
execute if score #math diff_z matches ..0 run scoreboard players operation #math diff_z *= #math negate 