execute unless data storage floating_ui:temp custom.params[0] run return 0

#设置值
function floating_ui:element/custom/set_param/set_value with storage floating_ui:temp custom.params[0]

data remove storage floating_ui:temp custom.params[0]

function floating_ui:element/custom/set_param/loop