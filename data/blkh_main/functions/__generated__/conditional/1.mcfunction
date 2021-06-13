# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

scoreboard players operation @s bhcs_time_tick = @s bhcs_time
execute as @s[predicate=blkh_main:mode_identify_2] at @s run function blkh_main:gravitified_block
execute as @s[predicate=blkh_main:mode_identify_3] at @s run function blkh_main:gravitified_block
scoreboard players set #execute LANG_MC_INTERNAL 1