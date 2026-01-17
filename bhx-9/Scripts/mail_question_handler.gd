extends NinePatchRect

var opened: bool = false
var up_pos: float = 150
var down_pos: float = 1083

func _on_mouse_entered() -> void:
	if opened: return
	opened = true
	animate_up()

func _on_down_mouse_entered() -> void:
	if opened: return
	opened = true
	animate_up()

func _on_down_mouse_exited() -> void:
	#await get_tree().create_timer(0.05).timeout
	if not opened: return
	opened = false
	animate_down()

func _on_mouse_exited() -> void:
	if not opened: return
	opened = false
	animate_down()

func animate_up() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position:y", up_pos, 0.4).set_trans(Tween.TRANS_QUINT)

func animate_down() -> void:
	var tween = create_tween()
	tween.tween_property(self, "position:y", down_pos, 0.4).set_trans(Tween.TRANS_QUINT)
