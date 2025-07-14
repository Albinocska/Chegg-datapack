scoreboard objectives add blue_x dummy
scoreboard objectives add blue_z dummy
scoreboard objectives add red_x dummy
scoreboard objectives add red_z dummy
scoreboard objectives add diff_z dummy
scoreboard objectives add diff_x dummy
execute as @e[tag=king,team=blue] store result score #math blue_z run data get entity @s Pos[2]
execute as @e[tag=king,team=blue] store result score #math blue_x run data get entity @s Pos[0]
execute as @e[tag=king,team=red] store result score #math red_z run data get entity @s Pos[2]
execute as @e[tag=king,team=blue] store result score #math red_x run data get entity @s Pos[0]
execute store result score #math diff_x run scoreboard players operation #math blue_x -= #math red_x
execute store result score #math diff_z run scoreboard players operation #math blue_z -= #math red_z