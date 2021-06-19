# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute as @e[type=armor_stand, tag=blkh_blackhole] at @s run function custom_settings:__generated__/execute/14
execute as @e[type=armor_stand, tag=blkh_finder, tag=lava] at @s run tp @s ~ ~ ~ facing entity @e[limit=1, type=armor_stand, tag=blkh_blackhole]