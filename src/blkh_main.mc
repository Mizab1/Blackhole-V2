import ./macros/raycast.mcm
import ./macros/internal_macros.mcm

#> Clocks
clock 1s{
    execute as @e[type=armor_stand, tag=blkh_blackhole] at @s run{
        execute(if score @s bhcs_time_tick matches 1..){
            scoreboard players remove @s bhcs_time_tick 1
        }
        execute(if score @s bhcs_time_tick matches ..0){
            scoreboard players operation @s bhcs_time_tick = @s bhcs_time
            execute as @s[predicate=blkh_main:mode_identify_2] at @s run{
                block{
                    # AS/AT the finder or the sphere around the blackhole
                    execute as @e[type=minecraft:armor_stand, tag=blkh_finder, tag=block] at @s run{
                        function blkh_main:test_block
                        fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace #aestd1:all_but_leaves
                        execute unless block ~ ~-2 ~ air run{
                            summon tnt ~ ~2 ~ {Fuse:0}
                        }
                        tp ^ ^ ^-1
                    }
                }
            }
            execute as @s[predicate=blkh_main:mode_identify_3] at @s run{
                execute as @e[type=minecraft:armor_stand, tag=blkh_finder, tag=lava] at @s run{
                    fill ~3 ~3 ~3 ~-3 ~-3 ~-3 lava replace air
                    tp ^ ^ ^-1
                }
            }
            execute as @s[predicate=blkh_main:mode_identify_4] at @s run{
                execute as @e[type=minecraft:armor_stand, tag=blkh_finder, tag=water] at @s run{
                    fill ~3 ~3 ~3 ~-3 ~-3 ~-3 water
                    tp ^ ^ ^-1
                }
            }
            execute as @s[predicate=blkh_main:mode_identify_5] at @s run{
                execute as @e[type=minecraft:armor_stand, tag=blkh_finder, tag=inverted] at @s run{
                    fill ~3 ~3 ~3 ~-3 ~-3 ~-3 white_concrete replace air
                    tp ^ ^ ^-1
                }
            }
            execute as @s[predicate=blkh_main:mode_identify_7] at @s run{
                execute as @e[type=minecraft:armor_stand, tag=blkh_finder, tag=life] at @s run{
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 coarse_dirt replace grass_block
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 air replace water
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 air replace oak_leaves 
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 air replace spruce_leaves 
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 air replace birch_leaves 
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 air replace dark_oak_leaves 
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 air replace jungle_leaves 
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 air replace acacia_leaves 
                    fill ~6 ~6 ~6 ~-6 ~-6 ~-6 cobblestone replace mossy_cobblestone  
                    particle soul ~ ~ ~ 6 6 6 0.1 50 normal
                    kill @e[type=!#blkh_main:ignored_entities, distance=..10]
                    tp ^ ^ ^-1
                }
            }
        }
    }
}

clock 10s{
    execute as @e[type=armor_stand, tag=hive] at @s positioned ~-10 ~2 ~-10 run{
        LOOP(2, i){
            summon zombie ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            summon husk ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            # summon ravager ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            # summon phantom ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
        }
    }
    execute as @e[type=armor_stand, tag=upgraded_hive] at @s positioned ~-10 ~2 ~-10 run{
        LOOP(2, i){
            # summon zombie ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            # summon husk ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            summon ravager ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            summon phantom ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
        }
    }

	execute as @e[type=armor_stand, tag=cave] at @s positioned ~-10 ~2 ~-10 run{
        LOOP(2, i){
            summon zombie ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            summon husk ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            # summon ravager ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
            # summon phantom ~<%(Math.random()*7) + 6%> ~ ~<%(Math.random()*7) + 6%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
        }
    }
	execute as @e[type=armor_stand, tag=phantom_spawn] at @s positioned ~ ~ ~ run{
        LOOP(2, i){
            summon phantom ~ ~2 ~ {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
        }
    }
	execute as @e[type=armor_stand, tag=ravager_spawner] at @s positioned ~ ~ ~ run{
        LOOP(2, i){
            summon ravager ~<%Math.random() + 1%> ~ ~<%Math.random() + 1%> {DeathLootTable:"minecraft:bat",Tags:["alien"],CustomName:'{"text":"Alien"}'}
        }
    }
}

clock 10t{
    # AS/AT the block, Do a bit of maths to align its motion to the blackhole
    block{
        name block_motion
        execute as @e[type=falling_block, tag=blkh_block] at @s run{
            execute store result score @s blkh_pos_x1 run data get entity @s Pos[0] 1000
            execute store result score @s blkh_pos_y1 run data get entity @s Pos[1] 1000
            execute store result score @s blkh_pos_z1 run data get entity @s Pos[2] 1000
            tp @s[tag=blkh_new_block] ^ ^ ^0.1 facing entity @e[type=armor_stand, tag=blkh_blackhole, sort=nearest, limit=1, predicate=blkh_main:mode_identify_2]
            # tp @s[tag=blkh_inverted_block] ^ ^ ^-0.1 facing entity @e[type=armor_stand, tag=blkh_blackhole, sort=nearest, limit=1]
            # tag @s remove blkh_new_block
            execute store result score @s blkh_pos_x2 run data get entity @s Pos[0] 1000
            execute store result score @s blkh_pos_y2 run data get entity @s Pos[1] 1000
            execute store result score @s blkh_pos_z2 run data get entity @s Pos[2] 1000

            scoreboard players operation @s blkh_pos_x2 -= @s blkh_pos_x1
            scoreboard players operation @s blkh_pos_y2 -= @s blkh_pos_y1
            scoreboard players operation @s blkh_pos_z2 -= @s blkh_pos_z1

            execute store result entity @s Motion[0] double 0.002 run scoreboard players get @s blkh_pos_x2
            execute store result entity @s Motion[1] double 0.002 run scoreboard players get @s blkh_pos_y2
            execute store result entity @s Motion[2] double 0.002 run scoreboard players get @s blkh_pos_z2
        }
    }
}

function load{
    # Declare 2 sets of variables to store the positons of the entity (blkh_block)
    scoreboard objectives add blkh_pos_x1 dummy
    scoreboard objectives add blkh_pos_y1 dummy
    scoreboard objectives add blkh_pos_z1 dummy

    scoreboard objectives add blkh_pos_x2 dummy
    scoreboard objectives add blkh_pos_y2 dummy
    scoreboard objectives add blkh_pos_z2 dummy

    # blackhole tickrate (Handles it power over time)
    #scoreboard objectives add blkh_tickrate dummy
    scoreboard objectives add blkh_private dummy

    scoreboard players set $0 blkh_private 0
    scoreboard players set $bh_msg blkh_private 0
    scoreboard players set $destroyed blkh_private 0

    scoreboard objectives add stats dummy {"text": "STATS","color": "green"}
    scoreboard objectives setdisplay sidebar stats
    team add red
    team modify red color gold
    team join red Objectives:

    scoreboard objectives add coas_click used:carrot_on_a_stick
}

function tick{
    execute as @a at @s run{
        execute if entity @e[type=armor_stand, tag=hive, distance=..30] run title @a actionbar {"text":"Use Blackhole to destroy the Hive", "color":"yellow"}
        execute if entity @e[type=armor_stand, tag=cave, distance=..40] run title @a actionbar {"text":"Use Inverted Blackhole to Block the Tunnel", "color":"yellow"}
        execute positioned -48 42 -68 if entity @s[distance=..20, tag=!v_area1] run{
            tag @s add v_area1
            tellraw @a {"text":"You have to use block hole to destroy the hives, and use entity hole to make way to the hive", "color":"yellow"}
        } 
        execute positioned 4 40 -59 if entity @s[distance=..20, tag=!v_area2] run{
            tag @s add v_area2
            tellraw @a {"text":"Use life hole to suck the leaves obstacles to reach the underground level", "color":"yellow"}
        } 
        execute positioned -73 38 9 if entity @s[distance=..20, tag=!v_area3] run{
            tag @s add v_area3
            tellraw @a {"text":"You have to cover all the crater with a lava hole", "color":"yellow"}
        } 
        execute positioned 350 44 -76 if entity @s[distance=..20, tag=!v_area4] run{
            tag @s add v_area4
            tellraw @a {"text":"Clear the lava to pass through it", "color":"yellow"}
        } 
        execute positioned 6 14 -206 if entity @s[distance=..20, tag=!v_area5] run{
            tag @s add v_area5
            tellraw @a {"text":"Use the heavy blackhole to suck the big mobs", "color":"yellow"}
        } 
    }

    execute as @e[type=armor_stand, tag=phantom_spawn] at @s if block ~ ~1 ~ lava run{
        scoreboard players add $destroyed blkh_private 1
        kill @s
        # 2
    }
    execute as @e[type=armor_stand, tag=ravager_spawner] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_5, distance=..30] run{
        scoreboard players add $destroyed blkh_private 1
        kill @s
        # 1
    }
	execute as @e[type=armor_stand, tag=cave] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_5, distance=..30] run{
        scoreboard players add $destroyed blkh_private 1
        kill @s
        # 1
    }
    # Hive destroy
    execute as @e[tag=hive] at @s if block ~ ~ ~ air run{
        scoreboard players add $destroyed blkh_private 1
        kill @s
        # 5
    }

    execute if score $destroyed blkh_private matches 9.. run{
        scoreboard players set $destroyed blkh_private 0
        title @a title {"text":"You have completed all the missions!", "color":"gold"}
        tellraw @a {"text":"you killed all the aliens, now you can get fun destroying the abandonated mars base, you could try to experiment with more blackholes together, that would be useful for the science, and also would be funny", "color":"gold"}
    }

    # execute as @e[type=armor_stand, tag=glow] at @s if entity @a[distance=..20] run kill @s 


    # AS/AT the blocks which are made my blackhole, trigger if they are close to the blackhole and kill them to increase perfomance
    execute as @e[type=falling_block, tag=blkh_block] at @s if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..2] run{
        kill @s
    }

    # AS/AT black hole itself
    execute as @e[type=armor_stand, tag=blkh_blackhole] at @s run{
        # Plasma jet
        particle dust 1.000 0.647 0.000 3 ~ ~ ~ 0 10 0 1 10 force
        LOOP(180, i){
            particle dust 1.000 0.647 0.000 1 ~<%Math.sin(i)*(i/15)%> ~ ~<%Math.cos(i)*(i/15)%> 0.5 0 0.5 1 2 force
        }
        LOOP(70, i){
            particle reverse_portal ~<%Math.sin(i)*(i/15)%> ~ ~<%Math.cos(i)*(i/15)%> 0.5 0 0.5 0.05 1 force
        }
    }

    # TP the mob toward the black hole
    execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_1] as @e[type=!#blkh_main:ignored_entities] at @s run{
        entity_suck blkh_main:mode_identify_1
    }
    execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_6] as @e[type=!#blkh_main:ignored_entities_heavy] at @s run{
        entity_suck blkh_main:mode_identify_6
    }

    # Test bow
    execute as @e[type=arrow,nbt={inGround:1b}] at @s run{
        function custom_settings:summon_bh
        kill @s
        execute if score $bh_msg blkh_private matches 0 run{
            scoreboard players set $bh_msg blkh_private 1
            schedule 5s append{
                tellraw @a {"text":"Blackhole out of control! Evacuate quickly", "color":"red"}
            }
        }
    }

    # blackhole destroy
	execute as @a[scores={coas_click=1..}, predicate=blkh_main:blackhole_destroyer] at @s run{
		scoreboard players set @s coas_click 0

        block{
            execute anchored eyes if block ~ ~ ~ #blkh_main:passable run{
                particle dust 0.976 1.000 0.239 1 ^-1.2 ^-0.6 ^1.2 0.1 0.1 0.1 1 5 normal
                execute if block ~ ~ ~ #blkh_main:passable unless entity @e[type=armor_stand, tag=blkh_blackhole, distance=..3] positioned ^ ^ ^1 run function $block
                execute if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..3] run{
                    kill @e[type=armor_stand, tag=blkh_blackhole, distance=..3]
                    function blkh_main:kill_all
                }
            }
        }
	}

    # gun
	execute as @a[scores={coas_click=1..}, predicate=blkh_main:gun] at @s run{
		scoreboard players set @s coas_click 0

        block{
            execute as @s at @s anchored eyes if block ~ ~ ~ #blkh_main:passable run{
                particle dust 0.976 1.000 0.239 1 ^-1.2 ^-0.6 ^1.2 0.1 0.1 0.1 1 5 normal
                execute if block ~ ~ ~ #blkh_main:passable unless entity @e[tag=alien, dx=0] positioned ^ ^ ^1 run function $block
                execute if entity @e[tag=alien, dx=0] run{
                    summon firework_rocket ~ ~ ~ {Life:1,LifeTime:1,FireworksItem:{id:firework_rocket,Count:1,tag:{Fireworks:{Explosions:[{Type:1,Trail:1b,Colors:[I;11515136,16761372]}]}}}}
                }
            }
        }
	}

    # glow enemy
    execute as @a[scores={coas_click=1..}, predicate=blkh_main:glow] at @s run{
		scoreboard players set @s coas_click 0
        # effect give @e[tag=alien] glowing 20 1 true
        effect give @e[type=armor_stand, tag=hive] glowing 20 1 true
        effect give @e[type=armor_stand, tag=cave] glowing 20 1 true
        effect give @e[type=armor_stand, tag=ravager_spawner] glowing 20 1 true
        effect give @e[type=armor_stand, tag=phantom_spawn] glowing 20 1 true
        # effect give @e[type=armor_stand, tag=glow] glowing 20 1 true
	}


    # Alien counter
    scoreboard players set Objectives: stats 0
    execute as @e[tag=cave] run scoreboard players add Objectives: stats 1
    execute as @e[tag=hive] run scoreboard players add Objectives: stats 1
    execute as @e[tag=ravager_spawner] run scoreboard players add Objectives: stats 1
    execute as @e[tag=phantom_spawn] run scoreboard players add Objectives: stats 1

    # Hive counter
    # scoreboard players set Hive: stats 0
    # execute as @e[tag=hive] run scoreboard players add Hive: stats 1


    effect give @a night_vision 50 1 true
}


# AS/AT the circumference of the blackhole, used for testing the block which is at the pos of the armor stand, and convert it to a "falling_block" entity with a tag "blkh_block"
# "blkh_finder" is the tag of the armor stand
function test_block{
    execute if block ~ ~-2.5 ~ #aestd1:opaque_1 run{
        LOOP(["minecraft:acacia_log","minecraft:acacia_planks","minecraft:acacia_wood","minecraft:ancient_debris","minecraft:andesite","minecraft:barrel","minecraft:basalt","minecraft:beehive","minecraft:bee_nest","minecraft:birch_log","minecraft:birch_planks","minecraft:birch_wood","minecraft:black_concrete","minecraft:black_concrete_powder","minecraft:black_glazed_terracotta","minecraft:black_terracotta","minecraft:black_wool","minecraft:blackstone","minecraft:blue_concrete","minecraft:blue_concrete_powder","minecraft:blue_glazed_terracotta","minecraft:blue_ice","minecraft:blue_terracotta","minecraft:blue_wool","minecraft:bone_block","minecraft:bookshelf","minecraft:brain_coral_block","minecraft:bricks","minecraft:brown_concrete","minecraft:brown_concrete_powder","minecraft:brown_glazed_terracotta","minecraft:brown_mushroom_block","minecraft:brown_terracotta","minecraft:brown_wool","minecraft:bubble_coral_block","minecraft:cartography_table","minecraft:carved_pumpkin","minecraft:chain_command_block","minecraft:chiseled_nether_bricks","minecraft:chiseled_polished_blackstone","minecraft:chiseled_quartz_block","minecraft:chiseled_red_sandstone","minecraft:chiseled_sandstone","minecraft:chiseled_stone_bricks","minecraft:clay","minecraft:coal_block","minecraft:coal_ore","minecraft:coarse_dirt","minecraft:cobblestone","minecraft:command_block","minecraft:cracked_nether_bricks","minecraft:cracked_polished_blackstone_bricks","minecraft:cracked_stone_bricks","minecraft:crafting_table","minecraft:crimson_hyphae","minecraft:crimson_nylium","minecraft:crimson_planks","minecraft:crimson_stem","minecraft:crying_obsidian","minecraft:cut_red_sandstone","minecraft:cut_sandstone","minecraft:cyan_concrete","minecraft:cyan_concrete_powder","minecraft:cyan_glazed_terracotta","minecraft:cyan_terracotta","minecraft:cyan_wool","minecraft:dark_oak_log","minecraft:dark_oak_planks","minecraft:dark_oak_wood","minecraft:dark_prismarine","minecraft:dead_brain_coral_block","minecraft:dead_bubble_coral_block","minecraft:dead_fire_coral_block","minecraft:dead_horn_coral_block","minecraft:dead_tube_coral_block","minecraft:diamond_block","minecraft:diamond_ore","minecraft:diorite","minecraft:dirt","minecraft:dispenser","minecraft:dried_kelp_block","minecraft:dropper","minecraft:emerald_block","minecraft:emerald_ore","minecraft:end_gateway"], i){
            execute if block ~ ~-2.5 ~ <%i%> run summon falling_block ~ ~2 ~ {BlockState:{Name:"<%i%>"},Time:300,Tags:["blkh_block","blkh_new_block"],NoGravity:1b}
        }
    }
    execute if block ~ ~-2.5 ~ #aestd1:opaque_2 run{
        LOOP(["minecraft:end_stone","minecraft:end_stone_bricks","minecraft:fire_coral_block","minecraft:fletching_table","minecraft:gilded_blackstone","minecraft:gold_block","minecraft:gold_ore","minecraft:granite","minecraft:grass_block","minecraft:gravel","minecraft:gray_concrete","minecraft:gray_concrete_powder","minecraft:gray_glazed_terracotta","minecraft:gray_terracotta","minecraft:gray_wool","minecraft:green_concrete","minecraft:green_concrete_powder","minecraft:green_glazed_terracotta","minecraft:green_terracotta","minecraft:green_wool","minecraft:hay_block","minecraft:honeycomb_block","minecraft:horn_coral_block","minecraft:infested_chiseled_stone_bricks","minecraft:infested_cobblestone","minecraft:infested_cracked_stone_bricks","minecraft:infested_mossy_stone_bricks","minecraft:infested_stone","minecraft:infested_stone_bricks","minecraft:iron_block","minecraft:iron_ore","minecraft:jigsaw","minecraft:jukebox","minecraft:jungle_log","minecraft:jungle_planks","minecraft:jungle_wood","minecraft:lapis_block","minecraft:lapis_ore","minecraft:light_blue_concrete","minecraft:light_blue_concrete_powder","minecraft:light_blue_glazed_terracotta","minecraft:light_blue_terracotta","minecraft:light_blue_wool","minecraft:light_gray_concrete","minecraft:light_gray_concrete_powder","minecraft:light_gray_glazed_terracotta","minecraft:light_gray_terracotta","minecraft:light_gray_wool","minecraft:lime_concrete","minecraft:lime_concrete_powder","minecraft:lime_glazed_terracotta","minecraft:lime_terracotta","minecraft:lime_wool","minecraft:lodestone","minecraft:loom","minecraft:magenta_concrete","minecraft:magenta_concrete_powder","minecraft:magenta_glazed_terracotta","minecraft:magenta_terracotta","minecraft:magenta_wool","minecraft:magma_block","minecraft:melon","minecraft:mossy_cobblestone","minecraft:mossy_stone_bricks","minecraft:mycelium","minecraft:nether_bricks","minecraft:nether_gold_ore","minecraft:nether_quartz_ore","minecraft:nether_wart_block","minecraft:netherite_block","minecraft:netherrack","minecraft:note_block","minecraft:oak_log","minecraft:oak_planks","minecraft:oak_wood","minecraft:observer","minecraft:obsidian","minecraft:orange_concrete","minecraft:orange_concrete_powder","minecraft:orange_glazed_terracotta","minecraft:orange_terracotta","minecraft:orange_wool","minecraft:packed_ice","minecraft:pink_concrete","minecraft:pink_concrete_powder","minecraft:pink_glazed_terracotta"], i){
            execute if block ~ ~-2.5 ~ <%i%> run summon falling_block ~ ~2 ~ {BlockState:{Name:"<%i%>"},Time:300,Tags:["blkh_block","blkh_new_block"],NoGravity:1b}
        }
    }
    execute if block ~ ~-2.5 ~ #aestd1:opaque_3 run{
        LOOP(["minecraft:pink_terracotta","minecraft:pink_wool","minecraft:podzol","minecraft:polished_andesite","minecraft:polished_basalt","minecraft:polished_blackstone","minecraft:polished_blackstone_bricks","minecraft:polished_diorite","minecraft:polished_granite","minecraft:prismarine","minecraft:prismarine_bricks","minecraft:pumpkin","minecraft:purple_concrete","minecraft:purple_concrete_powder","minecraft:purple_glazed_terracotta","minecraft:purple_terracotta","minecraft:purple_wool","minecraft:purpur_block","minecraft:purpur_pillar","minecraft:quartz_block","minecraft:quartz_bricks","minecraft:quartz_pillar","minecraft:red_concrete","minecraft:red_concrete_powder","minecraft:red_glazed_terracotta","minecraft:red_mushroom_block","minecraft:red_nether_bricks","minecraft:red_sand","minecraft:red_sandstone","minecraft:red_terracotta","minecraft:red_wool","minecraft:redstone_block","minecraft:redstone_lamp","minecraft:redstone_ore","minecraft:repeating_command_block","minecraft:respawn_anchor","minecraft:sand","minecraft:sandstone","minecraft:shroomlight","minecraft:smithing_table","minecraft:smooth_quartz","minecraft:smooth_red_sandstone","minecraft:smooth_sandstone","minecraft:smooth_stone","minecraft:snow_block","minecraft:soul_soil","minecraft:sponge","minecraft:spruce_log","minecraft:spruce_planks","minecraft:spruce_wood","minecraft:stone","minecraft:stone_bricks","minecraft:stripped_acacia_log","minecraft:stripped_acacia_wood","minecraft:stripped_birch_log","minecraft:stripped_birch_wood","minecraft:stripped_crimson_hyphae","minecraft:stripped_crimson_stem","minecraft:stripped_dark_oak_log","minecraft:stripped_dark_oak_wood","minecraft:stripped_jungle_log","minecraft:stripped_jungle_wood","minecraft:stripped_oak_log","minecraft:stripped_oak_wood","minecraft:stripped_spruce_log","minecraft:stripped_spruce_wood","minecraft:stripped_warped_hyphae","minecraft:stripped_warped_stem","minecraft:structure_block","minecraft:target","minecraft:terracotta","minecraft:tube_coral_block","minecraft:warped_hyphae","minecraft:warped_nylium","minecraft:warped_planks","minecraft:warped_stem","minecraft:warped_wart_block","minecraft:wet_sponge","minecraft:white_concrete","minecraft:white_concrete_powder","minecraft:white_glazed_terracotta","minecraft:white_terracotta","minecraft:white_wool","minecraft:yellow_concrete","minecraft:yellow_concrete_powder","minecraft:yellow_glazed_terracotta","minecraft:yellow_terracotta","minecraft:yellow_wool"], i){
            execute if block ~ ~-2.5 ~ <%i%> run summon falling_block ~ ~2 ~ {BlockState:{Name:"<%i%>"},Time:300,Tags:["blkh_block","blkh_new_block"],NoGravity:1b}
        }
    }

    execute as @e[type=falling_block, tag=blkh_block] at @s run{
        # data modify entity @s Motion[0] set value 0
        # data modify entity @s Motion[1] set value 0
        # data modify entity @s Motion[2] set value 0

        execute store result entity @s Motion[0] double 1 run scoreboard players get $0 blkh_private
        execute store result entity @s Motion[1] double 1 run scoreboard players get $0 blkh_private
        execute store result entity @s Motion[2] double 1 run scoreboard players get $0 blkh_private
    }
}

# Kill all the blackhole, blocks, items
function kill_all{
    kill @e[type=falling_block, tag=blkh_block]
    kill @e[type=armor_stand, tag=blkh_blackhole]
    kill @e[type=armor_stand, tag=blkh_finder]
    kill @e[type=item]
}

function help{
    tellraw @a {"text":"------- HELP! -------","color":"green"}
    tellraw @a {"text":"1. The signs you're seeing in front are called Blackhole attributes, It governs how the blackhole behave.","color":"green"}
    tellraw @a {"text":"2. Well good news is you can combine any attributes into a single blackhole, to do that just go to the required attributes using signs and click craft, it will generate the seed which has those attribues.","color":"green"}
    tellraw @a {"text":"3. Now some important stuff, you have crafted the seed, what now? You can't just throw it to anyone's face and expect it to work, right? Well for that You can see the special blackhole gun and the ammo aside, take that gun and hold the seed on the off hand, now if you fire the gun, it will summon the blackhole, if you done it correctly.\n","color":"green"}
    tellraw @a {"text":"NOTE:","color":"red", "bold": true}
    tellraw @a {"text":"I know you did not fully read the top, if you didn't read it bro :p","color":"red"}
    tellraw @a {"text":"1. Speed are in seconds not minutes or ticks, so if you select 4, it will take 4 seconds to expand to the next step","color":"red"}
    tellraw @a {"text":"2. Hold the seed on the left hand while shooting","color":"red"}
    tellraw @a {"text":"3. To summon the blackhole, use the blackhole gun and ammo","color":"red"}
}


#> Grp and Predicates
entities ignored_entities{
    minecraft:player
    minecraft:armor_stand
    minecraft:item_frame
    minecraft:falling_block
    minecraft:arrow
    minecraft:ravager
}

entities ignored_entities_heavy{
    minecraft:player
    minecraft:armor_stand
    minecraft:item_frame
    minecraft:falling_block
    minecraft:arrow
}

blocks passable{
    minecraft:air
    minecraft:cave_air
    minecraft:lava
    minecraft:water
    minecraft:fire
    minecraft:white_concrete
}

predicates mode_identify_1{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "head": {
        "nbt": "{Mode:1}"
      }
    }
  }
}

predicates mode_identify_2{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "head": {
        "nbt": "{Mode:2}"
      }
    }
  }
}

predicates mode_identify_3{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "head": {
        "nbt": "{Mode:3}"
      }
    }
  }
}

predicates mode_identify_4{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "head": {
        "nbt": "{Mode:4}"
      }
    }
  }
}

predicates mode_identify_5{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "head": {
        "nbt": "{Mode:5}"
      }
    }
  }
}

predicates mode_identify_6{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "head": {
        "nbt": "{Mode:6}"
      }
    }
  }
}

predicates mode_identify_7{
  "condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "head": {
        "nbt": "{Mode:7}"
      }
    }
  }
}

predicates blackhole_destroyer{
	"condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "mainhand": {
        "item": "minecraft:carrot_on_a_stick",
        "nbt": "{CustomModelData:100100}"
      }
    }
  }
}

predicates gun{
	"condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "mainhand": {
        "item": "minecraft:carrot_on_a_stick",
        "nbt": "{CustomModelData:100101}"
      }
    }
  }
}

predicates glow{
	"condition": "minecraft:entity_properties",
  "entity": "this",
  "predicate": {
    "equipment": {
      "mainhand": {
        "item": "minecraft:carrot_on_a_stick",
        "nbt": "{CustomModelData:100102}"
      }
    }
  }
}