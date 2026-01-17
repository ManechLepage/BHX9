class_name InputHandler
extends Node

var selected_window: WindowUI
var input_state: InputState

var offset: Vector2

@onready var main: Node2D = $".."
@onready var mouse: Sprite2D = $"../Mouse"

@onready var twitter: WindowUI = %Twitter
@onready var article: WindowUI = %Article
@onready var news: WindowUI = %News

enum InputState {
	NONE,
	SELECTING
}

func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_HIDDEN
	

@warning_ignore("unused_parameter")
func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		mouse.position = mouse.get_global_mouse_position()

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
	twitter.z_index = 1
	article.z_index = 1
	news.z_index = 1
	
	selected_window.z_index = 3

func _on_news_click() -> void:
	article.z_index -= 1
	twitter.z_index -= 1
	news.z_index = 3

func _on_article_click() -> void:
	twitter.z_index -= 1
	article.z_index = 3
	news.z_index -= 1

func _on_twitter_click() -> void:
	twitter.z_index = 3
	article.z_index -= 1
	news.z_index -= 1
