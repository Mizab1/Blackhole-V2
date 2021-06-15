# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

scoreboard players add $cur_size bhcs_time 1
setblock -39 77 -101 air
setblock -39 77 -101 warped_wall_sign[facing=west]{Text1:'{"text":"[ Size ]","color":"yellow","bold":true}',Text3:'{"score":{"name":"$cur_timer","objective":"bhcs_time"},"color":"blue","bold":true}'} replace
scoreboard players set #execute LANG_MC_INTERNAL 1