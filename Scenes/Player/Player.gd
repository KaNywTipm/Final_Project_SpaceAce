extends Area2D


class_name Player


const GROUP_NAME: String = "Player"


@onready var sprite_2d: Sprite2D = $Sprite2D



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


func _enter_tree() -> void:
	add_to_group(GROUP_NAME)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
