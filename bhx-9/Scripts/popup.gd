class_name PopupUI
extends PanelContainer

signal response_word(word:String)

func _on_augmenter_pressed() -> void:
	response_word.emit(" augmente ")

func _on_diminuer_pressed() -> void:
	response_word.emit(" diminue ")
