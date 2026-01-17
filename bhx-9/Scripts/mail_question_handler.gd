class_name Investigation
extends NinePatchRect

var opened: bool = false
var up_pos: float = 150
var down_pos: float = 1083
@onready var down: Button = $Down
var tween: Tween

@export var email: Email
@onready var texture_rect: TextureRect = $ScrollContainer/Top/Panel/TextureRect
@onready var name_label: Label = $ScrollContainer/Top/Name
@onready var email_label: Label = $ScrollContainer/Top/email
@onready var date: Label = $ScrollContainer/Top/date
@onready var header: Label = $ScrollContainer/Top/Header
@onready var body: RichTextLabel = $ScrollContainer/Top/body

func load_email() -> void:
	texture_rect.texture = email.profile_picture
	name_label.text = email.name
	email_label.text = email.adress
	date.text = email.date
	header.text = email.title
	body.load_email()

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
