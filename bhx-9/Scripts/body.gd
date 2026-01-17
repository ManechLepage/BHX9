extends RichTextLabel

@onready var investigation: Investigation = $"../../.."
@onready var ljn: WindowUI = $"../../../../LJN"


func _ready() -> void:
	text = investigation.email.request_message
	self.meta_clicked.connect(update)

func twitter_cycliste() -> void:
	pass

func article_cycliste() -> void:
	ljn.visible = true

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
