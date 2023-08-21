advancement revoke @s from sds:detect/take_hit

execute on attacker if predicate sds:can_disable run playsound item.shield.break player @s ~ ~ ~
execute on attacker unless predicate sds:can_disable run playsound item.shield.block player @s ~ ~ ~
scoreboard players reset @s sds.use.shield
