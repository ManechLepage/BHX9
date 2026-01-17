class_name InputHandler
extends Node

var selected_window: WindowUI
var input_state: InputState

var offset: Vector2

@onready var main: Node2D = $".."
@onready var mouse: Node2D = $"../Mouse"
@onready var investigation: Investigation = $"../Investigation"
@onready var mail_ui: WindowUI = $"../Mail"

var active_windows: Array[WindowUI]

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
	active_windows.erase(selected_window)
	active_windows.append(selected_window)
	
	var index: int = 1
	for window in active_windows:
		window.z_index = index
		index += 1

func add_window(window: WindowUI) -> void:
	active_windows.append(window)
	window.click.connect(focus_selected_window)
	window.selected.connect(select_window)
	window.unselect.connect(unselect_window)

func investigate_email(mail: Mail) -> void:
	investigation.email = mail.email_info
	investigation.load_email()
	investigation.animate_up()
	await get_tree().create_timer(0.2).timeout
	var tween = create_tween()
	tween.tween_property(mail_ui, "scale", Vector2.ZERO, 0.2).set_trans(Tween.TRANS_LINEAR)
	await tween.finished
	mail_ui.visible = false
	mail_ui.scale = Vector2.ONE
