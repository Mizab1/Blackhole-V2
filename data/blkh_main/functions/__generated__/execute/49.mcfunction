# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

particle dust 0.976 1.000 0.239 1 ^-1.2 ^-0.6 ^1.2 0.1 0.1 0.1 1 5 normal
execute if block ~ ~ ~ #blkh_main:passable unless entity @e[type=armor_stand, tag=blkh_blackhole, distance=..3] positioned ^ ^ ^1 run function blkh_main:__generated__/execute/49
execute if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..3] run function blkh_main:__generated__/execute/51