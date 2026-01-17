extends RichTextLabel

@onready var investigation: Investigation = $"../../.."
@onready var ljn: WindowUI = $"../../../../Bicyclettes/LJN"
@onready var input_handler: InputHandler = $"../../../../InputHandler"


func _ready() -> void:
	text = investigation.email.request_message
	self.meta_clicked.connect(update)

func twitter_cycliste() -> void:
	pass

func article_cycliste() -> void:
	show_window(ljn)

func news_cycliste() -> void:
	pass

func update(_value:Variant) -> void:
	var value = str(_value)
	if value == "twitter_cycliste":
		twitter_cycliste()
	if value == "article_cycliste":
		article_cycliste()
	if value == "news_cycliste":
		news_cycliste()

func show_window(window:WindowUI) -> void:
	window.visible = true
	window.scale = Vector2.ZERO
	var tween = create_tween()
	tween.tween_property(window, "scale", Vector2.ONE, 0.1).set_trans(Tween.TRANS_LINEAR)
	input_handler.add_window(window)
