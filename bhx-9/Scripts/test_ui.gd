extends RichTextLabel

func _ready() -> void:
	self.meta_clicked.connect(update)

func update(value: Variant) -> void:
	print(value)
