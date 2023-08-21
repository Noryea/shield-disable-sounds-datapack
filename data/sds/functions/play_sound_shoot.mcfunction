advancement revoke @s from sds:detect/take_shoot

execute on attacker at @s run playsound item.shield.block player @s ~ ~ ~
scoreboard players reset @s sds.use.shield
