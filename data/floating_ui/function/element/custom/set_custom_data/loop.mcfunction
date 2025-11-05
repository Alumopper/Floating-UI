execute unless data storage floating_ui:temp custom_data[0] run return 0

#if temp.custom_data don't contains this data key and this data has a default value, then set this data as default 
function floating_ui:element/custom/set_custom_data/set with storage floating_ui:temp custom_data[0]

data remove storage floating_ui:temp custom_data[0]

function floating_ui:element/custom/set_param/loop