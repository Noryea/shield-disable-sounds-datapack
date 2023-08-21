execute store result score originX2 sds.vec.temp run data get entity @s Pos[0] 1000
execute store result score originZ2 sds.vec.temp run data get entity @s Pos[2] 1000
execute rotated ~ 0 run summon marker ^ ^ ^1 {Tags:["sds.player.marker"]}
execute store result score vecX2 sds.vec.temp run data get entity @e[tag=sds.player.marker,limit=1,sort=nearest] Pos[0] 1000
execute store result score vecZ2 sds.vec.temp run data get entity @e[tag=sds.player.marker,limit=1,sort=nearest] Pos[2] 1000
scoreboard players operation vecX2 sds.vec.temp -= originX2 sds.vec.temp
scoreboard players operation vecZ2 sds.vec.temp -= originZ2 sds.vec.temp

scoreboard players operation vecX2 sds.vec.temp *= vecX sds.vec.temp
scoreboard players operation vecZ2 sds.vec.temp *= vecZ sds.vec.temp
scoreboard players operation 值 sds.vec.temp = vecX2 sds.vec.temp
scoreboard players operation 值 sds.vec.temp += vecZ2 sds.vec.temp

execute if score 值 sds.vec.temp matches ..0 run tag @s add sds.dotp.pass
kill @e[tag=sds.player.marker]