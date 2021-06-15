# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

scoreboard players remove $cur_mode bhcs_mode 1
function custom_settings:modifiers/mode/mode_increment_display
scoreboard players set #execute LANG_MC_INTERNAL 1