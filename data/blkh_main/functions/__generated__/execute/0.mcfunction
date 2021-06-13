# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score @s bhcs_time_tick matches 1.. run function blkh_main:__generated__/conditional/0
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score @s bhcs_time_tick matches ..0 run function blkh_main:__generated__/conditional/1