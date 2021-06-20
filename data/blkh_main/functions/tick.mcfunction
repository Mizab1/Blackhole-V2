# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute as @a at @s run function blkh_main:__generated__/execute/28
execute as @e[type=armor_stand, tag=phantom_spawn] at @s if block ~ ~1 ~ lava run function blkh_main:__generated__/execute/36
execute as @e[type=armor_stand, tag=phantom_spawn_2] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_5, distance=..30] run function blkh_main:__generated__/execute/37
execute as @e[type=armor_stand, tag=ravager_spawner] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_5, distance=..30] run function blkh_main:__generated__/execute/38
execute as @e[type=armor_stand, tag=cave] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_5, distance=..30] run function blkh_main:__generated__/execute/39
execute as @e[tag=hive] at @s if block ~ ~ ~ air run function blkh_main:__generated__/execute/40
execute if score $destroyed blkh_private matches 9.. run function blkh_main:__generated__/execute/41
scoreboard players set Objectives: stats 0
execute as @e[tag=cave] run scoreboard players add Objectives: stats 1
execute as @e[tag=hive] run scoreboard players add Objectives: stats 1
execute as @e[tag=ravager_spawner] run scoreboard players add Objectives: stats 1
execute as @e[tag=phantom_spawn] run scoreboard players add Objectives: stats 1
execute as @e[tag=phantom_spawn_2] run scoreboard players add Objectives: stats 1
execute as @e[type=falling_block, tag=blkh_block] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..2] run kill @s
execute as @e[type=armor_stand, tag=blkh_blackhole] at @s run function blkh_main:__generated__/execute/48
execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_1] as @e[type=!#blkh_main:ignored_entities] at @s run function blkh_main:__generated__/execute/49
execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_6] as @e[type=!#blkh_main:ignored_entities_heavy] at @s run function blkh_main:__generated__/execute/53
execute as @e[type=arrow,nbt={inGround:1b}] at @s run function blkh_main:__generated__/execute/57
execute as @a[scores={coas_click=1..}, predicate=blkh_main:blackhole_destroyer] at @s run function blkh_main:__generated__/execute/59
execute as @a[scores={coas_click=1..}, predicate=blkh_main:gun] at @s run function blkh_main:__generated__/execute/63
execute as @a[scores={coas_click=1..}, predicate=blkh_main:glow] at @s run function blkh_main:__generated__/execute/67
effect give @a night_vision 50 1 true