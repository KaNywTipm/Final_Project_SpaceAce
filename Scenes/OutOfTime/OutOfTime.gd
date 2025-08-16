extends Node


@export var life_s: float = 30.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await get_tree().create_timer(life_s).timeout
	get_parent().queue_free()
