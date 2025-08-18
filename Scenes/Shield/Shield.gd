extends Area2D


class_name Shield


@export var start_health: int = 5


@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var sound: AudioStreamPlayer2D = $Sound


var _health: int = start_health


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
