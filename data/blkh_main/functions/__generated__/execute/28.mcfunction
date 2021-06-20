# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute if entity @e[type=armor_stand, tag=hive, distance=..30] run title @a actionbar {"text":"Use Blackhole to destroy the Hive", "color":"yellow"}
execute if entity @e[type=armor_stand, tag=cave, distance=..40] run title @a actionbar {"text":"Use Inverted Blackhole to Block the Tunnel", "color":"yellow"}
execute positioned -48 42 -68 if entity @s[distance=..20, tag=!v_area1] run function blkh_main:__generated__/execute/31
execute positioned 4 40 -59 if entity @s[distance=..20, tag=!v_area2] run function blkh_main:__generated__/execute/32
execute positioned -73 38 9 if entity @s[distance=..20, tag=!v_area3] run function blkh_main:__generated__/execute/33
execute positioned 350 44 -76 if entity @s[distance=..20, tag=!v_area4] run function blkh_main:__generated__/execute/34
execute positioned 6 14 -206 if entity @s[distance=..20, tag=!v_area5] run function blkh_main:__generated__/execute/35