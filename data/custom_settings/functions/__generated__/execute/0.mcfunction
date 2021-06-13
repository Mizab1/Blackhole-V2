# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute store result entity @s Item.tag.Time int 1 run scoreboard players get $cur_timer bhcs_time
execute store result entity @s Item.tag.Mode int 1 run scoreboard players get $cur_mode bhcs_mode
execute store result entity @s Item.tag.Color int 1 run scoreboard players get $cur_color bhcs_color