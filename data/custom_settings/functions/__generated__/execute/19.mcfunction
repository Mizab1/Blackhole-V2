# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute as @e[type=armor_stand, tag=blkh_blackhole] at @s run function custom_settings:__generated__/execute/20
execute as @e[type=armor_stand, tag=blkh_finder, tag=inverted] at @s run tp @s ~ ~ ~ facing entity @e[limit=1, type=armor_stand, tag=blkh_blackhole]