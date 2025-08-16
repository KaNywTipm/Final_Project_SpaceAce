extends Node2D


const ADD_OBJECT: String = "add_object"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func add_object(obj: Node, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos
