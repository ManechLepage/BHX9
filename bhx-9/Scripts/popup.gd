class_name PopupUI
extends PanelContainer

signal response_word(word:String)
var velo_value: int

func _on_augmenter_pressed() -> void:
	response_word.emit(self, "augmenté.")

func _on_diminuer_pressed() -> void:
	response_word.emit(self, " diminué.")

func _on_confirm_pressed() -> void:
	response_word.emit(self, str(velo_value))

func _on_spin_box_value_changed(value: float) -> void:
	velo_value = int(value)

func _on_augmenter2_pressed() -> void:
	response_word.emit(self, "accord")

func _on_diminuer2_pressed() -> void:
	response_word.emit(self, "désaccord")
