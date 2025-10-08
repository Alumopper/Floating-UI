function floating_ui:element/control/_notified

#0 - 源更新通知
execute if score now floating_ui.notify_id = SOURCE_UPDATE floating_ui.notify_id run function floating_ui:element/stackpanel/binding/update_source