class_name Investigation
extends NinePatchRect

var opened: bool = false
var up_pos: float = 150
var down_pos: float = 1083
@onready var down: Button = $Down
var tween: Tween

@export var email: Email

func _on_down_mouse_entered() -> void:
	if tween and tween.is_running(): return
	opened = true
	animate_up()

func _on_mouse_exited() -> void:
	opened = false
	animate_down()

func animate_up() -> void:
	tween = create_tween()
	tween.tween_property(self, "position:y", up_pos, 0.4).set_trans(Tween.TRANS_QUINT)

func animate_down() -> void:
	tween = create_tween()
	tween.tween_property(self, "position:y", down_pos, 0.4).set_trans(Tween.TRANS_QUINT)
