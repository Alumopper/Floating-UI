#$function log:_debug {msg: "Creating control: $(type)"}
$execute if data storage floating_ui:data std.'$(type)' run return run function floating_ui:macro/new_control/std {type: '$(type)'}
$execute if data storage floating_ui:data custom.'$(type)' run return run function floating_ui:element/custom/_new
$function floating_ui:util/_error_track {"ex":"NoSuchControlException","msg":"未知的控件: $(type)"}