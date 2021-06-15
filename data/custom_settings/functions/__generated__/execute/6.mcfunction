# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @a[limit=1, sort=nearest] Inventory[{Slot:-106b}].tag.Color
execute store result entity @s ArmorItems[3].tag.Mode int 1 run data get entity @a[limit=1, sort=nearest] Inventory[{Slot:-106b}].tag.Mode
execute store result score @s bhcs_time run data get entity @a[limit=1, sort=nearest] Inventory[{Slot:-106b}].tag.Time
scoreboard players operation @s bhcs_time_tick = @s bhcs_time
tag @s add checked
execute as @s[predicate=blkh_main:mode_identify_2] at @s run function blkh_main:spawn
execute as @s[predicate=blkh_main:mode_identify_3] at @s run function blkh_main:spawn
execute as @s[predicate=blkh_main:mode_identify_4] at @s run function blkh_main:spawn
execute as @s[predicate=blkh_main:mode_identify_5] at @s run function blkh_main:spawn
execute as @s[predicate=blkh_main:mode_identify_7] at @s run function blkh_main:spawn