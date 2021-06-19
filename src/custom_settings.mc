# bhcs = blackhole custom settings
import ./macros/internal_macros.mcm

function load{
    #> --- Modifiers
    scoreboard objectives add bhcs_time dummy
    # scoreboard players set $time_max bhcs_time 3
    scoreboard players set $cur_timer bhcs_time 3
    setblock -39 78 -101 air
    setblock -39 78 -101 warped_wall_sign[facing=west]{Text1:'{"text":"[ Speed ]","color":"yellow","bold":true}',Text3:'{"score":{"name":"$cur_timer","objective":"bhcs_time"},"color":"blue","bold":true}'} replace
    scoreboard objectives add bhcs_time_tick dummy

    scoreboard objectives add bhcs_mode dummy
    scoreboard players set $mode_max bhcs_mode 7
    scoreboard players set $cur_mode bhcs_mode 1

    scoreboard objectives add bhcs_color dummy
    scoreboard players set $color_max bhcs_color 100007
    scoreboard players set $cur_color bhcs_color 100001

    scoreboard objectives add bhcs_size dummy
    scoreboard players set $size_max bhcs_size 100070
    scoreboard players set $cur_size bhcs_size 10

    #> --- private 
    scoreboard objectives add bhcs_private dummy
    scoreboard players set $min bhcs_private 1
    scoreboard players set $color_min bhcs_private 100001

    scoreboard players set $100000 bhcs_private
}

dir modifiers{
    dir timer{
        function increment{
            scoreboard players add $cur_timer bhcs_time 1
            setblock -39 78 -101 air
            setblock -39 78 -101 warped_wall_sign[facing=west]{Text1:'{"text":"[ Speed ]","color":"yellow","bold":true}',Text3:'{"score":{"name":"$cur_timer","objective":"bhcs_time"},"color":"blue","bold":true}'} replace
        }
        function decrement{
            execute(if score $cur_timer bhcs_time > $min bhcs_private){
                scoreboard players remove $cur_timer bhcs_time 1
                setblock -39 78 -101 air
                setblock -39 78 -101 warped_wall_sign[facing=west]{Text1:'{"text":"[ Speed ]","color":"yellow","bold":true}',Text3:'{"score":{"name":"$cur_timer","objective":"bhcs_time"},"color":"blue","bold":true}'} replace
            }
        }
    }

    dir size{
        function increment{
            execute(if score $cur_timer bhcs_time > $min bhcs_private){
                scoreboard players add $cur_size bhcs_time 1
                setblock -39 77 -101 air
                setblock -39 77 -101 warped_wall_sign[facing=west]{Text1:'{"text":"[ Size ]","color":"yellow","bold":true}',Text3:'{"score":{"name":"$cur_timer","objective":"bhcs_time"},"color":"blue","bold":true}'} replace
            }
        }
        function decrement{
            execute(if score $cur_timer bhcs_time > $min bhcs_private){
                scoreboard players remove $cur_timer bhcs_time 1
                setblock -39 77 -101 air
                setblock -39 77 -101 warped_wall_sign[facing=west]{Text1:'{"text":"[ Size ]","color":"yellow","bold":true}',Text3:'{"score":{"name":"$cur_timer","objective":"bhcs_time"},"color":"blue","bold":true}'} replace
            }
        }
    }

    dir mode{
        function increment{
            execute(if score $cur_mode bhcs_mode < $mode_max bhcs_mode){
                scoreboard players add $cur_mode bhcs_mode 1
                # Show the messgage
                block{
                    name mode_increment_display
                    execute(if score $cur_mode bhcs_mode matches 1){
                        # Custom Macro: display <coords> <main title> <sub type> 
                        display -39 78 -105 Mode Entity
                    }
                    execute(if score $cur_mode bhcs_mode matches 2){
                        display -39 78 -105 Mode Block
                    }
                    execute(if score $cur_mode bhcs_mode matches 3){
                        display -39 78 -105 Mode Lava
                    }
                    execute(if score $cur_mode bhcs_mode matches 4){
                        display -39 78 -105 Mode Water
                    }
                    execute(if score $cur_mode bhcs_mode matches 5){
                        display -39 78 -105 Mode Inverted
                    }
                    execute(if score $cur_mode bhcs_mode matches 6){
                        display -39 78 -105 Mode Heavy
                    }
                    execute(if score $cur_mode bhcs_mode matches 7){
                        display -39 78 -105 Mode Life
                    }
                }
            }
        }
        function decrement{
            execute(if score $cur_mode bhcs_mode > $min bhcs_private){
                scoreboard players remove $cur_mode bhcs_mode 1
                function custom_settings:modifiers/mode/mode_increment_display
            }
        }
    }

    dir color{
        function increment{
            execute(if score $cur_color bhcs_color < $color_max bhcs_color){
                scoreboard players add $cur_color bhcs_color 1
                block{
                    name color_increment_display
                    execute(if score $cur_color bhcs_color matches 100001){
                        display -39 77 -105 Color Black
                    }
                    execute(if score $cur_color bhcs_color matches 100002){
                        display -39 77 -105 Color Red
                    }
                    execute(if score $cur_color bhcs_color matches 100003){
                        display -39 77 -105 Color Blue
                    }
                    execute(if score $cur_color bhcs_color matches 100004){
                        display -39 77 -105 Color Magenta
                    }
                    execute(if score $cur_color bhcs_color matches 100005){
                        display -39 77 -105 Color Lime
                    }
                    execute(if score $cur_color bhcs_color matches 100006){
                        display -39 77 -105 Color Orange
                    }
                    execute(if score $cur_color bhcs_color matches 100007){
                        display -39 77 -105 Color White
                    }
                }
            }
        }
        function decrement{
            execute(if score $cur_color bhcs_color > $color_min bhcs_private){
                scoreboard players remove $cur_color bhcs_color 1
                function custom_settings:modifiers/color/color_increment_display
            }
        }
    }
}

function craft{
    summon item -42 82 -102 {Tags:["bhcs_item"],Item:{id:"minecraft:scute",Count:1b,tag:{display:{Name:'{"text":"Blackhole Seed","color":"green"}'},CustomModelData:100100}}}
    execute as @e[type=item, tag=bhcs_item, limit=1] run{
        execute store result entity @s Item.tag.Time int 1 run scoreboard players get $cur_timer bhcs_time
        execute store result entity @s Item.tag.Mode int 1 run scoreboard players get $cur_mode bhcs_mode
        execute store result entity @s Item.tag.Color int 1 run scoreboard players get $cur_color bhcs_color
        execute store result entity @s Item.tag.CustomModelData int 1 run scoreboard players get $cur_color bhcs_color
    }
    block{
        name craft_particle
        execute positioned -42 79 -102 run{
            LOOP(12, i){
                particle dust 0.906 1.000 0.071 1 ~<%Math.sin(i)%> ~ ~<%Math.cos(i)%> 0 2 0 0 20 normal
                particle dust 0.169 0.808 1.000 1 ~<%Math.sin(i)%> ~ ~<%Math.cos(i)%> 0 2 0 0 20 normal
            }
        }
    }
}

function summon_bh{
    summon armor_stand ~ ~6 ~ {Marker:1b,Invisible:1b,Tags:["blkh_blackhole"],ArmorItems:[{},{},{},{id:"minecraft:wooden_hoe",Count:1b,tag:{CustomModelData:100001}}]}
    execute as @e[type=armor_stand, tag=blkh_blackhole, tag=!checked] at @s run{
        execute store result entity @s ArmorItems[3].tag.CustomModelData int 1 run data get entity @a[limit=1, sort=nearest] Inventory[{Slot:-106b}].tag.Color
        execute store result entity @s ArmorItems[3].tag.Mode int 1 run data get entity @a[limit=1, sort=nearest] Inventory[{Slot:-106b}].tag.Mode
        execute store result score @s bhcs_time run data get entity @a[limit=1, sort=nearest] Inventory[{Slot:-106b}].tag.Time
        scoreboard players operation @s bhcs_time_tick = @s bhcs_time
        tag @s add checked

        spawn_radius blkh_main:mode_identify_2 block
        spawn_radius blkh_main:mode_identify_3 lava
        spawn_radius blkh_main:mode_identify_4 water
        spawn_radius blkh_main:mode_identify_5 inverted
        spawn_radius blkh_main:mode_identify_7 life
    }
}


# summon zombie ~ ~ ~ {DeathLootTable:"minecraft:bat",PersistenceRequired:1b,Tags:["alien"],CustomName:'{"text":"Alien"}'}
# summon husk ~ ~ ~ {DeathLootTable:"minecraft:bat",PersistenceRequired:1b,Tags:["alien"],CustomName:'{"text":"Alien"}'}
# give @p endermite_spawn_egg{display:{Name:'{"text":"Alien1"}'},EntityTag:{id:"minecraft:zombie",DeathLootTable:"minecraft:bat",PersistenceRequired:1b,Tags:["alien"],CustomName:'{"text":"Alien"}'}} 1
# give @p endermite_spawn_egg{display:{Name:'{"text":"Alien2"}'},EntityTag:{id:"minecraft:husk",DeathLootTable:"minecraft:bat",PersistenceRequired:1b,Tags:["alien"],CustomName:'{"text":"Alien"}'}} 1
# give @p endermite_spawn_egg{display:{Name:'{"text":"Alien3"}'},EntityTag:{id:"minecraft:ravager",DeathLootTable:"minecraft:bat",PersistenceRequired:1b,Tags:["alien"],CustomName:'{"text":"Alien"}'}} 1
# give @p endermite_spawn_egg{display:{Name:'{"text":"Alien4"}'},EntityTag:{id:"minecraft:phantom",DeathLootTable:"minecraft:bat",PersistenceRequired:1b,Tags:["alien"],CustomName:'{"text":"Alien"}'}} 1
# summon minecraft:armor_stand ~ ~ ~ {Tags:["hive"], Invisible:1b}
# summon minecraft:armor_stand ~ ~ ~ {Tags:["cave"], Invisible:1b}
# summon minecraft:armor_stand ~ ~ ~ {Tags:["glow"], Invisible:1b}
# /give @p warped_sign{BlockEntityTag:{Text1:'{"text":"[ Mode ]","color":"yellow","bold":true}',Text3:'{"text":"Increase","color":"blue","bold":true,"clickEvent":{"action":"run_command","value":"/function custom_settings:modifiers/mode/increment"}}'}} 1