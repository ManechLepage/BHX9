extends Panel

@onready var response: RichTextLabel = $response
@onready var investigation: Investigation = $"../.."
var current_index = 0
@onready var button: Button = $"../Top/Button"
@onready var popups: Control = $"../../Popups"

func _on_button_pressed() -> void:
	if not investigation.email: return
	if current_index == 0: 
		next_step()
		button.disabled = true

func next_step() -> void:
	$"../..".frozen = true
	var previous_text = response.text
	var added_string = investigation.email.response_message[current_index]
	var filtered_string = ""
	for i in range(len(added_string)):
		await get_tree().create_timer(0.03).timeout
		var text = filtered_string
		
		text += "[color=blue]" + added_string[i] + "[/color]"
		text += "[color=red]" + "_" + "[/color]"
		
		response.text = previous_text + text
		
		filtered_string += added_string[i]
	response.text = previous_text + added_string
	current_index += 1
	if $"../../../Tuto".stage > 4: $"../..".frozen = false
	if current_index == investigation.email.response_message.size(): return
	
	await get_tree().create_timer(0.2).timeout
	
	var popup: PopupUI = popups.get_child(investigation.email.popup_offset + current_index - 1)
	var tween = create_tween()
	popup.scale = Vector2.ZERO
	popup.visible = true
	tween.tween_property(popup, "scale", Vector2.ONE, 0.1).set_trans(Tween.TRANS_LINEAR)
	popup.response_word.connect(receive_change)
	$"../../../Tuto".invest2_done()

func receive_change(popup: PopupUI, word: String) -> void:
	var tween = create_tween()
	tween.tween_property(popup, "scale", Vector2.ZERO, 0.1).set_trans(Tween.TRANS_LINEAR)
	await tween.finished
	popup.visible = false
	response.text += word
	investigation.answers.append(word)
	next_step()
