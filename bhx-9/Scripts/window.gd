class_name WindowUI
extends NinePatchRect

signal selected(window: WindowUI)
signal unselect()

signal click()

func _on_button_button_down() -> void:
	selected.emit(self)

func _on_button_button_up() -> void:
	unselect.emit()

func _on_button_2_button_down() -> void:
	click.emit()
