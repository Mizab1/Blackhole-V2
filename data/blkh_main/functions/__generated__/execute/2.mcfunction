# built using mc-build (https://github.com/mc-build/mc-build)
# Datapack Made by Mizab

function blkh_main:test_block
fill ~1 ~1 ~1 ~-1 ~-1 ~-1 air replace #aestd1:all_but_leaves
execute unless block ~ ~-2 ~ air run summon tnt ~ ~2 ~ {Fuse:0}
tp ^ ^ ^-1