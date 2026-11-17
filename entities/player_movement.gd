class_name PlayerMovement extends Node3D

@export var camera : Camera3D

const SPEED = 2.5


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	_process_movement(delta)
	
func _process_movement(delta:float) -> void:
	var direction = Vector3.ZERO
	
	if Input.is_action_pressed("ui_up"):
		direction += Vector3.FORWARD
	if Input.is_action_pressed("ui_down"):
		direction += Vector3.BACK
	if Input.is_action_pressed("ui_left"):
		direction += Vector3.LEFT
	if Input.is_action_pressed("ui_right"):
		direction += Vector3.RIGHT
		
	if not direction:
		return
		
	direction = direction.rotated(Vector3.UP, camera.rotation.y)
	direction = direction.normalized()
	direction *= SPEED
	
	self.position += direction * delta
	
