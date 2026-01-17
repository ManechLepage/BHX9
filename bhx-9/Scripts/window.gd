class_name WindowUI
extends NinePatchRect

signal selected(window: WindowUI)

func _on_button_pressed() -> void:
	selected.emit(self)


func select_window(window: WindowUI) -> void:
	pass # Replace with function body.
