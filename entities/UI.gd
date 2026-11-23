class_name UI extends CanvasLayer

@export var player : Player

@onready var popup = $Popup
@onready var confirm = $Confirm
const RAY_LENGTH = 1000

func _physics_process(delta):
	var cam : Camera3D = player.camera
	var space_state = cam.get_world_3d().direct_space_state
	var midpoint = Vector2(960, 540)

	var origin = cam.project_ray_origin(midpoint)
	var end = origin + cam.project_ray_normal(midpoint) * RAY_LENGTH
	var query = PhysicsRayQueryParameters3D.create(origin, end)
	query.collide_with_bodies = true
	query.exclude = [player]
	
	var result = space_state.intersect_ray(query)
	if confirm.visible:
		if result == {}:
			confirm.visible = false
	else:
		if result != {}:
			if result.collider is Interactable:
				popup.visible = true
				result.collider.visual.modulate = Color.YELLOW
			else:
				popup.visible = false
				get_tree().call_group(&"Interactable", "refresh_visual")
	
	
func _input(event: InputEvent) -> void:
	if event.is_action("interact") and popup.visible:
		confirm.visible = true
		popup.visible = false
		
	
