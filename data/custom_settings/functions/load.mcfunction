# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

scoreboard objectives add bhcs_time dummy
scoreboard players set $cur_timer bhcs_time 3
setblock -39 78 -101 air
setblock -39 78 -101 warped_wall_sign[facing=west]{Text1:'{"text":"[ Speed ]","color":"yellow","bold":true}',Text3:'{"score":{"name":"$cur_timer","objective":"bhcs_time"},"color":"blue","bold":true}'} replace
scoreboard objectives add bhcs_time_tick dummy
scoreboard objectives add bhcs_mode dummy
scoreboard players set $mode_max bhcs_mode 7
scoreboard players set $cur_mode bhcs_mode 1
scoreboard objectives add bhcs_color dummy
scoreboard players set $color_max bhcs_color 100007
scoreboard players set $cur_color bhcs_color 100001
scoreboard objectives add bhcs_size dummy
scoreboard players set $size_max bhcs_size 100070
scoreboard players set $cur_size bhcs_size 10
scoreboard objectives add bhcs_private dummy
scoreboard players set $min bhcs_private 1
scoreboard players set $color_min bhcs_private 100001
scoreboard players set $100000 bhcs_private