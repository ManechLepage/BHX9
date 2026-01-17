extends Button
@onready var timer: Timer = $Timer
@onready var label: Label = $Label

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	label.text = "0:" + str(int(timer.time_left))
