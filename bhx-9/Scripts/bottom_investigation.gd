extends Panel

@onready var response: RichTextLabel = $response
@onready var investigation: Investigation = $"../.."
var current_index = 0

func _on_button_pressed() -> void:
	next_step()

func next_step() -> void:
	var goal_text: String = investigation.email.response_message
	var anim: bool = true
	while anim:
		await get_tree().create_timer(0.03).timeout
		
		var next_char_index = current_index
		var next_char = goal_text[next_char_index]
		if next_char == "/":
			anim = false
		else:
			var text: String = ""
			for i in range(next_char_index - 1):
				text += goal_text[i]
			
			text += "[color=blue]" + next_char + "[/color]"
			text += "[color=red]" + "_" + "[/color]"
			
			response.text = text
			current_index += 1
