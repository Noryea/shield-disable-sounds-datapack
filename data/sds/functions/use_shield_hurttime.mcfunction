## To handle the "HurtTime > 0" situation where the attacker CANNOT be figured out at all.
# Note: this is only used to implement disabling sounds

tag @s add sds.self
execute as @a[distance=0..3.5,gamemode=!spectator,predicate=!sds:can_disable,predicate=sds:looking_at_target] run playsound item.shield.block player @s ~ ~ ~
execute as @a[distance=0..3.5,gamemode=!spectator,predicate=sds:can_disable,predicate=sds:looking_at_target] run tag @s add sds.disabler

# delay the sound playing event to confirm the shield is disabled
schedule function sds:play_sound_hurttime 1t append
