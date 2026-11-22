extends Camera3D

var mouse_move : Vector2

const LOOKAROUND_SPEED = .15

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(delta: float) -> void:
	mouse_move = Vector2.ZERO

func _input(event):
	if event is InputEventMouseMotion:
		mouse_move = event.relative
		
func _physics_process(delta: float) -> void:
	self.rotation.y -= mouse_move.x * LOOKAROUND_SPEED * delta
	self.rotation.x -= mouse_move.y * LOOKAROUND_SPEED * delta
