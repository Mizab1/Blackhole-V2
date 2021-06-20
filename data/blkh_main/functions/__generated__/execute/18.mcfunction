# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute store result score @s blkh_pos_x1 run data get entity @s Pos[0] 1000
execute store result score @s blkh_pos_y1 run data get entity @s Pos[1] 1000
execute store result score @s blkh_pos_z1 run data get entity @s Pos[2] 1000
tp @s[tag=blkh_new_block] ^ ^ ^0.1 facing entity @e[type=armor_stand, tag=blkh_blackhole, sort=nearest, limit=1, predicate=blkh_main:mode_identify_2]
execute store result score @s blkh_pos_x2 run data get entity @s Pos[0] 1000
execute store result score @s blkh_pos_y2 run data get entity @s Pos[1] 1000
execute store result score @s blkh_pos_z2 run data get entity @s Pos[2] 1000
scoreboard players operation @s blkh_pos_x2 -= @s blkh_pos_x1
scoreboard players operation @s blkh_pos_y2 -= @s blkh_pos_y1
scoreboard players operation @s blkh_pos_z2 -= @s blkh_pos_z1
execute store result entity @s Motion[0] double 0.002 run scoreboard players get @s blkh_pos_x2
execute store result entity @s Motion[1] double 0.002 run scoreboard players get @s blkh_pos_y2
execute store result entity @s Motion[2] double 0.002 run scoreboard players get @s blkh_pos_z2