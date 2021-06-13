# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute as @e[type=falling_block, tag=blkh_block] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..2] run kill @s
execute as @e[type=armor_stand, tag=blkh_blackhole] at @s run function blkh_main:__generated__/execute/16
execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_1] as @e[type=!#blkh_main:ignored_entities] at @s run function blkh_main:gravitified_entity
execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_3] as @e[type=!#blkh_main:ignored_entities] at @s run function blkh_main:gravitified_entity
execute as @e[type=arrow,nbt={inGround:1b}] at @s run function blkh_main:__generated__/execute/22
execute as @a[scores={coas_click=1..}, predicate=blkh_main:blackhole_destroyer] at @s run function blkh_main:__generated__/execute/24
execute as @a[scores={coas_click=1..}, predicate=blkh_main:gun] at @s run function blkh_main:__generated__/execute/28
effect give @a night_vision 50 1 true