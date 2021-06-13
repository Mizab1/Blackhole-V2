# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute store result score @s blkh_pos_x1 run data get entity @s Pos[0] 1000
execute store result score @s blkh_pos_y1 run data get entity @s Pos[1] 1000
execute store result score @s blkh_pos_z1 run data get entity @s Pos[2] 1000
execute facing entity @e[type=armor_stand, tag=blkh_blackhole, limit=1] eyes run tp @s ^ ^ ^0.05
execute store result score @s blkh_pos_x2 run data get entity @s Pos[0] 1000
execute store result score @s blkh_pos_y2 run data get entity @s Pos[1] 1000
execute store result score @s blkh_pos_z2 run data get entity @s Pos[2] 1000
scoreboard players operation @s blkh_pos_x2 -= @s blkh_pos_x1
scoreboard players operation @s blkh_pos_y2 -= @s blkh_pos_y1
scoreboard players operation @s blkh_pos_z2 -= @s blkh_pos_z1
execute store result entity @s Motion[0] double 0.005 run scoreboard players get @s blkh_pos_x2
execute store result entity @s Motion[1] double 0.005 run scoreboard players get @s blkh_pos_y2
execute store result entity @s Motion[2] double 0.005 run scoreboard players get @s blkh_pos_z2