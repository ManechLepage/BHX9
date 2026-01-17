extends ColorRect


func _ready() -> void:
	var tween :Tween = create_tween()
	tween.tween_property(self,"modulate",Color(0,0,0,0),6)
