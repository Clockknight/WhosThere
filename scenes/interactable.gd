class_name Interactable extends StaticBody3D

@export var vn_script : Dictionary
@export var visual : Sprite3D

func _ready() -> void:
	self.add_to_group(&"Interactable")

func refresh_visual() -> void:
	visual.modulate = Color.WHITE
