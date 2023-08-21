## To handle the "HurtTime > 0" situation where the attacker CANNOT be figured out at all.
tag @s add sds.self

# Get own vector
execute store result score originX sds.vec.temp run data get entity @s Pos[0] 1000
execute store result score originZ sds.vec.temp run data get entity @s Pos[2] 1000
execute rotated ~ 0 run summon marker ^ ^ ^1 {Tags:["sds.self.marker"]}
execute store result score vecX sds.vec.temp run data get entity @e[tag=sds.self.marker,limit=1,sort=nearest] Pos[0] 1000
execute store result score vecZ sds.vec.temp run data get entity @e[tag=sds.self.marker,limit=1,sort=nearest] Pos[2] 1000
scoreboard players operation vecX sds.vec.temp -= originX sds.vec.temp
scoreboard players operation vecZ sds.vec.temp -= originZ sds.vec.temp
kill @e[tag=sds.self.marker]

# Add "sds.dotp.pass" tag to all the players who can hit the shield
execute as @a[tag=!sds.self,gamemode=!spectator,distance=0..5] at @s facing entity @p[tag=sds.self] feet run function sds:hurttime/dot_product_check
#scoreboard players reset * sds.vec.temp

# Add "sds.ray.pass" tag to all the possible attacker
## reason: The vanilla "looking_at" predicate CANNOT handle the situation where the "center point" of target is invisible/obscured from attacker
execute anchored eyes positioned ^ ^ ^ run summon marker ~ ~ ~ {Tags:["sds.self.eyes"]}
execute positioned ~ ~0.45 ~ run summon marker ~ ~ ~ {Tags:["sds.self.feet"]}
execute as @a[tag=sds.dotp.pass] at @s anchored eyes positioned ^ ^ ^ run summon marker ~ ~ ~ {Tags:["sds.player.eyes"]}
execute as @a[tag=sds.dotp.pass] at @s anchored eyes positioned ^ ^ ^ run function sds:hurttime/ray_tracing_check
kill @e[tag=sds.self.eyes]
kill @e[tag=sds.self.feet]
kill @e[tag=sds.player.eyes]

# Play sounds
#execute as @a[tag=sds.ray.pass] run say pass
execute as @a[tag=sds.ray.pass] unless predicate sds:can_disable run playsound item.shield.block player @s ~ ~ ~
execute as @a[tag=sds.ray.pass] if predicate sds:can_disable run tag @s add sds.disabler

# Delay the sound playing event to confirm the shield is disabled
schedule function sds:play_sound_hurttime 1t append

tag @a remove sds.dotp.pass
tag @a remove sds.ray.pass