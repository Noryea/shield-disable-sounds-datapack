#particle crit ~ ~ ~ 0 0 0 0.1 10
execute if entity @e[tag=sds.self.eyes,distance=..0.58] run tag @s add sds.ray.pass
execute if entity @e[tag=sds.self.feet,distance=..0.58] run tag @s add sds.ray.pass

execute if entity @s[tag=!sds.ray.pass] if entity @e[tag=sds.player.eyes,distance=..2.8] positioned ^ ^ ^0.2 run function sds:hurttime/ray_tracing_check