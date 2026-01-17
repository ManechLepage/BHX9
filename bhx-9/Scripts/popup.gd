class_name PopupUI
extends PanelContainer

signal response_word(word:String)
var velo_value: int = 0
var groenland_value: int = 25

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

func _on_otan_pressed() -> void:
	response_word.emit(self, "de l'OTAN")

func _on_g_7_pressed() -> void:
	response_word.emit(self, "du G7")

func _on_spin_box_2_value_changed(value: float) -> void:
	groenland_value = int(value)

func _on_confirm_2_pressed() -> void:
	response_word.emit(self, str(groenland_value))

func _on_sont_pressed() -> void:
	response_word.emit(self, "sont")

func _on_sontpas_pressed() -> void:
	response_word.emit(self, "ne sont pas")
