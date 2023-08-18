## To handle the "HurtTime > 0" situation where the attacker CANNOT be figured out at all.
# Note: this is only used to implement disabling sounds, because we can't detect the attacks below 2 hearts

execute as @a[distance=0..4,predicate=sds:can_disable,predicate=sds:looking_at_target] run tag @s add sds.disabler
tag @s add sds.self

# delay the sound playing to confirm the shield is actually disabled
schedule function sds:play_sound_hurttime 2t append

advancement revoke @s from sds:detect/using_shield_during_hurttime