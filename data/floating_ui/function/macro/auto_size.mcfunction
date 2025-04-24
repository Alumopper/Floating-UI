$execute if data storage floating_ui:data std.$(type) run return run function floating_ui:element/$(type)/auto_size
$execute if data storage floating_ui:data custom.$(type) run return run function floating_ui:element/custom/auto_size
$function floating_ui:util/_error_track {"ex":"NoSuchControlException","msg":"未知的控件: $(type)"}