class_name InputHandler
extends Node

var selected_panel: Control
var input_state: InputState

enum InputState {
	NONE,
	SELECTING
}

func _input(event: InputEvent) -> void:
	pass
