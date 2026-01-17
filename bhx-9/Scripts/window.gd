class_name WindowUI
extends NinePatchRect

signal selected(window: WindowUI)

func _on_button_pressed() -> void:
	selected.emit(self)
