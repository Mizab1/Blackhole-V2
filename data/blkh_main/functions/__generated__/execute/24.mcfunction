# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute if entity @e[type=armor_stand, tag=hive, distance=..30] run title @a actionbar {"text":"Use Blackhole to destroy the Hive", "color":"yellow"}
execute if entity @e[type=armor_stand, tag=cave, distance=..40] run title @a actionbar {"text":"Use Inverted Blackhole to Block the Tunnel", "color":"yellow"}