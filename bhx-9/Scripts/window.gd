class_name WindowUI
extends NinePatchRect

signal selected(window: WindowUI)
signal unselect()

func _on_button_button_down() -> void:
	selected.emit(self)

func _on_button_button_up() -> void:
	unselect.emit()
