# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score $cur_mode bhcs_mode matches 1 run function custom_settings:modifiers/mode/__generated__/conditional/2
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score $cur_mode bhcs_mode matches 2 run function custom_settings:modifiers/mode/__generated__/conditional/3
scoreboard players set #execute LANG_MC_INTERNAL 0
execute if score $cur_mode bhcs_mode matches 3 run function custom_settings:modifiers/mode/__generated__/conditional/4