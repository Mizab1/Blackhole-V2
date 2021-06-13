# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

summon armor_stand ~ ~10 ~ {Marker:1b,Invisible:1b,Tags:["blkh_blackhole"],ArmorItems:[{},{},{},{id:"minecraft:wooden_hoe",Count:1b,tag:{CustomModelData:100001}}]}
execute as @e[type=armor_stand, tag=blkh_blackhole, tag=!checked] at @s run function custom_settings:__generated__/execute/5