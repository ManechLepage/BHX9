extends RichTextLabel

@onready var investigation: Investigation = $"../../.."

func _ready() -> void:
	text = investigation.email.request_message
	self.meta_clicked.connect(update)

func twitter() -> void:
	print("as")
	
func article() -> void:
	pass

func news() -> void:
	pass

func update(_value:Variant) -> void:
	print("awqes")
	var value = str(_value)
	if value == "twitter":
		twitter()
	if value == "article":
		article()
	if value == "news":
		news()
