import ./macros/raycast.mcm

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
                    name gravitified_block
                    # AS/AT the finder or the sphere around the blackhole
                    execute as @e[type=minecraft:armor_stand, tag=blkh_finder] at @s run{
                        function blkh_main:test_block
                        fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air
                        execute unless block ~ ~-2 ~ air run{
                            summon tnt ~ ~2 ~ {Fuse:0}
                        }
                        tp ^ ^ ^-1
                    }
                }
            }
            execute as @s[predicate=blkh_main:mode_identify_3] at @s run function blkh_main:gravitified_block
        }
    }
}

clock 10t{
    # AS/AT the block, Do a bit of maths to align it motion to the blackhole
    execute as @e[type=falling_block, tag=blkh_block] at @s run{
        execute store result score @s blkh_pos_x1 run data get entity @s Pos[0] 1000
        execute store result score @s blkh_pos_y1 run data get entity @s Pos[1] 1000
        execute store result score @s blkh_pos_z1 run data get entity @s Pos[2] 1000
        tp @s[tag=blkh_new_block] ^ ^ ^0.2 facing entity @e[type=armor_stand, tag=blkh_blackhole, sort=nearest, limit=1]
        # tag @s remove blkh_new_block
        execute store result score @s blkh_pos_x2 run data get entity @s Pos[0] 1000
        execute store result score @s blkh_pos_y2 run data get entity @s Pos[1] 1000
        execute store result score @s blkh_pos_z2 run data get entity @s Pos[2] 1000

        scoreboard players operation @s blkh_pos_x2 -= @s blkh_pos_x1
        scoreboard players operation @s blkh_pos_y2 -= @s blkh_pos_y1
        scoreboard players operation @s blkh_pos_z2 -= @s blkh_pos_z1

        execute store result entity @s Motion[0] double 0.003 run scoreboard players get @s blkh_pos_x2
        execute store result entity @s Motion[1] double 0.003 run scoreboard players get @s blkh_pos_y2
        execute store result entity @s Motion[2] double 0.003 run scoreboard players get @s blkh_pos_z2
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

    scoreboard objectives add coas_click used:carrot_on_a_stick
}

function tick{
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
        block{
            name gravitified_entity
            execute if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..40] run{
                effect give @s levitation 5 255 true
                execute facing entity @e[type=armor_stand, tag=blkh_blackhole, sort= nearest, limit=1] eyes run tp @s ^0.1 ^ ^0.2
            }
            execute if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..2] run kill @s
        }
    }
    execute as @e[type=armor_stand, tag=blkh_blackhole, predicate=blkh_main:mode_identify_3] as @e[type=!#blkh_main:ignored_entities] at @s run{
        function blkh_main:gravitified_entity
    }

    # execute as @e[type=falling_block, tag=blkh_block, tag=blkh_new_block] at @s run{
        
    # }

    # Test bow
    execute as @e[type=arrow,nbt={inGround:1b}] at @s run{
        function custom_settings:summon_bh
        kill @s
    }

    # blackhole destroy
	execute as @a[scores={coas_click=1..}, predicate=blkh_main:blackhole_destroyer] at @s run{
		scoreboard players set @s coas_click 0

        block{
            execute as @s at @s anchored eyes if block ~ ~ ~ #blkh_main:passable run{
                particle dust 0.976 1.000 0.239 1 ^-1.2 ^-0.6 ^1.2 0.1 0.1 0.1 1 5 normal
                execute if block ~ ~ ~ #blkh_main:passable unless entity @e[type=armor_stand, tag=blkh_blackhole, distance=..3] positioned ^ ^ ^1 run function $block
                execute if entity @e[type=armor_stand, tag=blkh_blackhole, distance=..3] run{
                    kill @e[type=armor_stand, tag=blkh_blackhole, distance=..3]
                    function blkh_main:kill_all
                }
            }
        }
	}
}


# AS/AT the circumference of the blackhole, used for testing the block which is at the pos of the armor stand, and convert it to a "falling_block" entity with a tag "blkh_block"
# "blkh_finder" is the tag of the armor stand
function test_block{
    execute if block ~ ~-2.5 ~ #aestd1:opaque_1 run{
        LOOP(["minecraft:acacia_log","minecraft:acacia_planks","minecraft:acacia_wood","minecraft:ancient_debris","minecraft:andesite","minecraft:barrel","minecraft:basalt","minecraft:bedrock","minecraft:beehive","minecraft:bee_nest","minecraft:birch_log","minecraft:birch_planks","minecraft:birch_wood","minecraft:black_concrete","minecraft:black_concrete_powder","minecraft:black_glazed_terracotta","minecraft:black_terracotta","minecraft:black_wool","minecraft:blackstone","minecraft:blue_concrete","minecraft:blue_concrete_powder","minecraft:blue_glazed_terracotta","minecraft:blue_ice","minecraft:blue_terracotta","minecraft:blue_wool","minecraft:bone_block","minecraft:bookshelf","minecraft:brain_coral_block","minecraft:bricks","minecraft:brown_concrete","minecraft:brown_concrete_powder","minecraft:brown_glazed_terracotta","minecraft:brown_mushroom_block","minecraft:brown_terracotta","minecraft:brown_wool","minecraft:bubble_coral_block","minecraft:cartography_table","minecraft:carved_pumpkin","minecraft:chain_command_block","minecraft:chiseled_nether_bricks","minecraft:chiseled_polished_blackstone","minecraft:chiseled_quartz_block","minecraft:chiseled_red_sandstone","minecraft:chiseled_sandstone","minecraft:chiseled_stone_bricks","minecraft:clay","minecraft:coal_block","minecraft:coal_ore","minecraft:coarse_dirt","minecraft:cobblestone","minecraft:command_block","minecraft:cracked_nether_bricks","minecraft:cracked_polished_blackstone_bricks","minecraft:cracked_stone_bricks","minecraft:crafting_table","minecraft:crimson_hyphae","minecraft:crimson_nylium","minecraft:crimson_planks","minecraft:crimson_stem","minecraft:crying_obsidian","minecraft:cut_red_sandstone","minecraft:cut_sandstone","minecraft:cyan_concrete","minecraft:cyan_concrete_powder","minecraft:cyan_glazed_terracotta","minecraft:cyan_terracotta","minecraft:cyan_wool","minecraft:dark_oak_log","minecraft:dark_oak_planks","minecraft:dark_oak_wood","minecraft:dark_prismarine","minecraft:dead_brain_coral_block","minecraft:dead_bubble_coral_block","minecraft:dead_fire_coral_block","minecraft:dead_horn_coral_block","minecraft:dead_tube_coral_block","minecraft:diamond_block","minecraft:diamond_ore","minecraft:diorite","minecraft:dirt","minecraft:dispenser","minecraft:dried_kelp_block","minecraft:dropper","minecraft:emerald_block","minecraft:emerald_ore","minecraft:end_gateway"], i){
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
}

#> Spawning and killing function
# Spawn the Blackhole armor stand with the tag "blkh_blackhole" and summon the black void (obviously retextured block but I donno which one :p)
function spawn{
    

    # Run the loop for summoning a circle around the blackhole
    execute as @e[type=armor_stand, tag=blkh_blackhole] at @s run{
        LOOP(4, i){
            LOOP(20, j){
                summon armor_stand ~<%Math.sin(j)*((i-4)*-1)%> ~<%i%> ~<%Math.cos(j)*((i-4)*-1)%> {Tags:["blkh_finder"], NoGravity:1b, Marker:1b, Invisible:1b}
            }
        }
        LOOP(4, i){
            LOOP(20, j){
                summon armor_stand ~<%Math.sin(j)*(i+1)%> ~<%i-4%> ~<%Math.cos(j)*(i+1)%> {Tags:["blkh_finder"], NoGravity:1b, Marker:1b, Invisible:1b}
            }
        }
        summon armor_stand ~ ~4 ~ {Tags:["blkh_finder"], NoGravity:1b, Marker:1b, Invisible:1b}
        summon armor_stand ~ ~-5 ~ {Tags:["blkh_finder"], NoGravity:1b, Marker:1b, Invisible:1b}

    }

    execute as @e[type=armor_stand, tag=blkh_finder] at @s run{
        tp @s ~ ~ ~ facing entity @e[limit=1, type=armor_stand, tag=blkh_blackhole]
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
    tellraw @a {"text":"1. Times are in seconds not minutes or ticks, so if you select 4, it will take 4 seconds to expand to the next step","color":"red"}
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
}

blocks passable{
    minecraft:air
    minecraft:cave_air
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