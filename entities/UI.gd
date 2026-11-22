class_name UI extends CanvasLayer

@export var player : Player

@onready var popup = $Popup

func _physics_process(delta):
	var space_state = popup.get_world_2d().direct_space_state
	# use global coordinates, not local to node
	var query = PhysicsRayQueryParameters2D.create(Vector2(0, 0), Vector2(50, 100))
	var result = space_state.intersect_ray(query)
	if result:
		print("Hit at point: ", result.position)
	# shoot a raycast from the camera's angle
	# if it hits the floating godot image
	# make the child sprite not invisible
