# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

summon item -42 82 -102 {Tags:["bhcs_item"],Item:{id:"minecraft:scute",Count:1b,tag:{display:{Name:'{"text":"Blackhole Seed","color":"green"}'},CustomModelData:100100}}}
execute as @e[type=item, tag=bhcs_item, limit=1] run function custom_settings:__generated__/execute/0
function custom_settings:craft_particle