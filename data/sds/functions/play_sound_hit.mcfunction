advancement revoke @s from sds:detect/root

execute on attacker if predicate sds:can_disable run playsound item.shield.break player @s ~ ~ ~
#execute on attacker if predicate sds:can_disable run stopsound @s * entity.player.attack.weak
execute on attacker unless predicate sds:can_disable run playsound item.shield.block player @s ~ ~ ~