class_name Mail
extends Button

@export var spawn_timer: float
@export var email_info: Email

@onready var texture_rect: TextureRect = $HBoxContainer/TextureRect
@onready var label: Label = $HBoxContainer/VBoxContainer/Label
@onready var label_2: Label = $HBoxContainer/VBoxContainer/Label2

func _ready() -> void:
	visible = false
	await get_tree().create_timer(spawn_timer).timeout
	visible = true
	
	texture_rect.texture = email_info.profile_picture
	label.text = email_info.name
	label_2.text = email_info.title

func _on_pressed() -> void:
	pass # Replace with function body.
