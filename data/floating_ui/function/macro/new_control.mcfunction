$execute if data storage floating_ui:data std.$(type) run return run function floating_ui:element/$(type)/_new with storage floating_ui:input temp
$execute if data storage floating_ui:input temp.init run function floating_ui:element/$(type)/event/init
$execute if data storage floating_ui:data custom.$(type) run return run function floating_ui:element/custom/_new
$function floating_ui:util/_error_track {"ex":"NoSuchControlException","msg":"未知的控件: $(type)"}