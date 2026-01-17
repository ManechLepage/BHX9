extends SubViewportContainer

@export var mouse3d : Node3D
@export var camera: Camera3D
var start_rot
var old_rot
var zoomed := false

func _ready() -> void:
	start_rot = camera.rotation

func _physics_process(delta: float) -> void:
	old_rot = camera.rotation
	mouse3d.position = camera.project_position((get_global_mouse_position()*0.3 + Vector2(960,540)*0.7),0.5)
	camera.look_at(mouse3d.position)
	camera.rotation = camera.rotation.lerp(start_rot,0.7)
	camera.rotation = old_rot.lerp(camera.rotation,0.1)
	camera.fov = lerp(camera.fov,(18- 5*(zoomed as int)) as float,0.1)
	if Input.is_action_just_pressed("zoom"):
			zoomed = true
	elif Input.is_action_just_released("zoom"):
			zoomed = false

	
	
	
