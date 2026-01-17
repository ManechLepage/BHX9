extends Panel

@export var scroll_speed: float = 1.0
@onready var box: HBoxContainer = $HBoxContainer
@onready var label: Label = $HBoxContainer/Label

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	box.position.x -= scroll_speed
	if box.position.x == -label.size.x:
		box.position.x = 40
