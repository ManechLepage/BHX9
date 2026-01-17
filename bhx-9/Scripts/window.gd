class_name WindowUI
extends NinePatchRect

@onready var input_handler: InputHandler = $"../InputHandler"

signal selected(window: WindowUI)
signal unselect()

signal click()

var up_pos = Vector2(238, 164)
var down_pos = Vector2()

func _on_button_button_down() -> void:
	selected.emit(self)

func _on_button_button_up() -> void:
	unselect.emit()

func _on_button_2_button_down() -> void:
	click.emit()

func change_score(value: String) -> void:
	get_node("PanelContainer/VBoxContainer/MainLabel").text = value

func _on_button_pressed() -> void:
	var tween = create_tween()
	tween.tween_property(self, "scale", Vector2.ZERO, 0.2).set_trans(Tween.TRANS_LINEAR)
	await tween.finished
	visible = false
	scale = Vector2.ONE
	input_handler.reset_emails()

func _on_exit_pressed() -> void:
	var input_manager: InputHandler = get_tree().get_first_node_in_group("InputManager")
	input_manager.delete_window(self)
