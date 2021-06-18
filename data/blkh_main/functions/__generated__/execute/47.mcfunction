# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

particle dust 0.976 1.000 0.239 1 ^-1.2 ^-0.6 ^1.2 0.1 0.1 0.1 1 5 normal
execute if block ~ ~ ~ #blkh_main:passable unless entity @e[tag=alien, dx=0] positioned ^ ^ ^1 run function blkh_main:__generated__/execute/48
execute if entity @e[tag=alien, dx=0] run summon firework_rocket ~ ~ ~ {Life:1,LifeTime:1,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;11515136,16761372]}]}}}}