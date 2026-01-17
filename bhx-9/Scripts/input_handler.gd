class_name InputHandler
extends Node

var selected_window: Control
var input_state: InputState

@onready var main: Node2D = $".."

@onready var twitter: PanelContainer = %Twitter
@onready var youtube: PanelContainer = %Youtube
@onready var news: PanelContainer = %News

enum InputState {
	NONE,
	SELECTING
}

@warning_ignore("unused_parameter")
func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("left_click"):
		handle_left_click()
	if Input.is_action_pressed("left_click"):
		handle_left_hold()
	if Input.is_action_just_released("left_click"):
		handle_left_release()

func handle_left_click() -> void:
	pass

func handle_left_hold() -> void:
	if input_state == InputState.NONE: return
	if selected_window:
		selected_window.position = selected_window.get_global_mouse_position()

func handle_left_release() -> void:
	pass

func select_window(window: Control) -> void:
	selected_window = window
	input_state = InputState.SELECTING

func unselect_window() -> void:
	input_state = InputState.NONE
	selected_window = null

func focus_selected_window() -> void:
	twitter.z_index = 5
	youtube.z_index = 5
	news.z_index = 5
	
	selected_window.z_index = 6
