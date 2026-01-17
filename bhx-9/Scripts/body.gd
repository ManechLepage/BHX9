extends RichTextLabel

@onready var investigation: Investigation = $"../../.."
@onready var ljn: WindowUI = $"../../../../Bicyclettes/LJN"
@onready var input_handler: InputHandler = $"../../../../InputHandler"
@onready var quacker_bicycle: WindowUI = $"../../../../Bicyclettes/QuackerBicycle"
@onready var news: WindowUI = $"../../../../Bicyclettes/News"
@onready var ljn_groenland: WindowUI = $"../../../../Groenland/LJNGroenland"
@onready var quacker_groenland: WindowUI = $"../../../../Groenland/QuackerGroenland"
@onready var tutube: WindowUI = $"../../../../Groenland/Tutube"


func load_email() -> void:
	text = investigation.email.request_message
	self.meta_clicked.connect(update)

func twitter_cycliste() -> void:
	show_window(quacker_bicycle)

func article_cycliste() -> void:
	show_window(ljn)

func news_cycliste() -> void:
	show_window(news)

func article_groenland() -> void:
	show_window(ljn_groenland)

func quacker() -> void:
	show_window(quacker_groenland)

func tutubes() -> void:
	show_window(tutube)

func update(_value:Variant) -> void:
	var value = str(_value)
	if value == "twitter_cycliste":
		twitter_cycliste()
	if value == "article_cycliste":
		article_cycliste()
	if value == "news_cycliste":
		news_cycliste()
	if value == "article_groenland":
		article_groenland()
	if value == "quacker_groenland":
		quacker()
	if value == "tutube":
		tutubes()

func show_window(window:WindowUI) -> void:
	window.visible = true
	window.scale = Vector2.ZERO
	var tween = create_tween()
	tween.tween_property(window, "scale", Vector2.ONE, 0.1).set_trans(Tween.TRANS_LINEAR)
	input_handler.add_window(window)
