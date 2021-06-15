# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

scoreboard players operation @s bhcs_time_tick = @s bhcs_time
execute as @s[predicate=blkh_main:mode_identify_2] at @s run function blkh_main:__generated__/block/0
execute as @s[predicate=blkh_main:mode_identify_3] at @s run execute as @e[type=minecraft:armor_stand, tag=blkh_finder] at @s run function blkh_main:__generated__/execute/5
execute as @s[predicate=blkh_main:mode_identify_4] at @s run execute as @e[type=minecraft:armor_stand, tag=blkh_finder] at @s run function blkh_main:__generated__/execute/7
execute as @s[predicate=blkh_main:mode_identify_5] at @s positioned ~-5 ~-5 ~-5 run function blkh_main:__generated__/execute/8
scoreboard players set #execute LANG_MC_INTERNAL 1