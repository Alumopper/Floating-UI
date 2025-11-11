$execute as @s run return run tellraw @a [{"text": "[DEBUG/","color": "gray"}, {selector: "@s"}, {"text": "] $(msg)","color": "gray"}]
$tellraw @a {"text": "[DEBUG]$(msg)","color": "gray"}