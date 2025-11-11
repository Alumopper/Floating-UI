scoreboard players set completed int 1
$tellraw @a {text: "[Error/timelist] A command execution not finished: $(run)", color: "red"}
data remove storage timelist:io list_event[0]