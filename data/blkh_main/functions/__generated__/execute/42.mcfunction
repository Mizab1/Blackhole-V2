# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

function custom_settings:summon_bh
kill @s
execute if score $bh_msg blkh_private matches 0 run function blkh_main:__generated__/execute/43