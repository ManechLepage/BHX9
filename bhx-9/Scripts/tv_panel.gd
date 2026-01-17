extends Panel

@export var scroll_speed: float = 1.0
@onready var label: Label = $Label

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	label.position.x -= scroll_speed
	if label.position.x == -label.size.x:
		label.position.x = 40
