class_name Email
extends Resource

@export var name: String
@export var adress: String
@export var title: String
@export var date: String
@export var profile_picture: Texture2D
@export_multiline var request_message: String
@export var response_message: Array[String]
@export var popup_offset:int = 0
@export var answers: Array[String]
