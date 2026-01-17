class_name InputHandler
extends Node

var selected_window: WindowUI
var input_state: InputState

var offset: Vector2

@onready var main: Node2D = $".."

@onready var twitter: WindowUI = %Twitter
@onready var article: WindowUI = %Article
@onready var news: WindowUI = %News

enum InputState {
	NONE,
	SELECTING
}

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	pass

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	if input_state == InputState.NONE: return
	if selected_window: 
		selected_window.position = selected_window.get_global_mouse_position() + offset

func select_window(window: WindowUI) -> void:
	selected_window = window
	input_state = InputState.SELECTING
	offset = selected_window.position - selected_window.get_global_mouse_position()
	focus_selected_window()

func unselect_window() -> void:
	input_state = InputState.NONE
	selected_window = null

func focus_selected_window() -> void:
	twitter.z_index -= 1
	article.z_index -= 1
	news.z_index -= 1
	
	selected_window.z_index = 3
