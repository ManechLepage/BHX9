class_name Investigation
extends NinePatchRect

var opened: bool = false
var up_pos: float = 150
var down_pos: float = 1083
@onready var down: Button = $Down
var tween: Tween
var ping_tween : Tween
var answers: Array[String]

var email: Email
@onready var texture_rect: TextureRect = $ScrollContainer/Top/Panel/TextureRect
@onready var name_label: Label = $ScrollContainer/Top/Name
@onready var email_label: Label = $ScrollContainer/Top/email
@onready var date: Label = $ScrollContainer/Top/date
@onready var header: Label = $ScrollContainer/Top/Header
@onready var body: RichTextLabel = $ScrollContainer/Top/body
@onready var win_window: WindowUI = $"../WinWindow"
@onready var button: Button = $ScrollContainer/Top/Button

func load_email() -> void:
	texture_rect.texture = email.profile_picture
	name_label.text = email.name
	email_label.text = email.adress
	date.text = email.date
	header.text = email.title
	body.load_email()
	ping()

func _on_down_mouse_entered() -> void:
	if tween and tween.is_running(): return
	opened = true
	animate_up()

func _on_mouse_exited() -> void:
	opened = false
	animate_down()

func animate_up() -> void:
	ping(true)
	tween = create_tween()
	tween.tween_property(self, "position:y", up_pos, 0.4).set_trans(Tween.TRANS_QUINT)

func animate_down() -> void:
	tween = create_tween()
	tween.tween_property(self, "position:y", down_pos, 0.4).set_trans(Tween.TRANS_QUINT)

func ping(kill = false) -> void:
	if kill:
		if ping_tween and ping_tween.is_running(): 
			ping_tween.kill()
			$Down/Sprite2D.visible = false
			
	else:
		$Down/Sprite2D.visible = true
		$Down/Sprite2D.scale = Vector2.ZERO
		$Down/Sprite2D.modulate = Color(Color.WHITE)
		ping_tween  = create_tween()
		ping_tween.set_loops(10)
		ping_tween.set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_QUAD)
		ping_tween.tween_property($Down/Sprite2D,"scale",Vector2.ONE * 5,2)
		ping_tween.parallel().tween_property($Down/Sprite2D,"modulate",Color(1,1,1,0),2)
		ping_tween.tween_property($Down/Sprite2D,"scale",Vector2.ZERO,0)
		ping_tween.tween_property($Down/Sprite2D,"modulate",Color(Color.WHITE),0)

func _on_send_pressed() -> void:
	var counter: int = 0
	for i in range(3):
		if answers[i] == email.answers[i]: counter += 1
	animate_down()
	await get_tree().create_timer(0.4).timeout
	
	var text = "Score: " + str(counter) + "/3"
	
	win_window.change_score(text)
	win_window.visible = true
	win_window.scale = Vector2.ZERO
	
	var tween2 = create_tween()
	tween2.tween_property(win_window, "scale", Vector2(1.5, 1.5), 0.5).set_trans(Tween.TRANS_BACK)
	tween2.chain().tween_property(win_window, "scale", Vector2.ONE, 0.2).set_trans(Tween.TRANS_CUBIC)
