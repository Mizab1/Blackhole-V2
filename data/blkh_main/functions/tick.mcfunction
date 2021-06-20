# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute as @a at @s run function blkh_main:__generated__/execute/27
execute as @e[type=armor_stand, tag=phantom_spawn] at @s if block ~ ~1 ~ lava run function blkh_main:__generated__/execute/35
execute as @e[type=armor_stand, tag=ravager_spawner] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_6, distance=..30] run function blkh_main:__generated__/execute/36
execute as @e[type=armor_stand, tag=cave] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_5, distance=..30] run function blkh_main:__generated__/execute/37
execute as @e[tag=hive] at @s if block ~ ~ ~ air run function blkh_main:__generated__/execute/38
execute if score $destroyed blkh_private matches 9.. run function blkh_main:__generated__/execute/39
execute as @e[type=falling_block, tag=blkh_block] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..2] run kill @s
execute as @e[type=armor_stand, tag=blkh_blackhole] at @s run function blkh_main:__generated__/execute/41
execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_1] as @e[type=!#blkh_main:ignored_entities] at @s run function blkh_main:__generated__/execute/42
execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_6] as @e[type=!#blkh_main:ignored_entities_heavy] at @s run function blkh_main:__generated__/execute/46
execute as @e[type=arrow,nbt={inGround:1b}] at @s run function blkh_main:__generated__/execute/50
execute as @a[scores={coas_click=1..}, predicate=blkh_main:blackhole_destroyer] at @s run function blkh_main:__generated__/execute/52
execute as @a[scores={coas_click=1..}, predicate=blkh_main:gun] at @s run function blkh_main:__generated__/execute/56
execute as @a[scores={coas_click=1..}, predicate=blkh_main:glow] at @s run function blkh_main:__generated__/execute/60
scoreboard players set Objectives: stats 0
execute as @e[tag=cave] run scoreboard players add Objectives: stats 1
execute as @e[tag=hive] run scoreboard players add Objectives: stats 1
execute as @e[tag=ravager_spawner] run scoreboard players add Objectives: stats 1
execute as @e[tag=phantom_spawn] run scoreboard players add Objectives: stats 1
effect give @a night_vision 50 1 true