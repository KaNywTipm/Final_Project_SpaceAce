extends EnemyBase


@export var shoots_at_player: bool = false
@export var aims_at_player: bool = false

@export var bullet_type: BulletBase.BulletType = BulletBase.BulletType.Enemy
@export var bullet_speed: float = 120.0
@export var bullet_direction: Vector2 = Vector2.DOWN
@export var bullet_wait_time: float = 3.0
@export var bullet_wait_time_var: float = 0.5
@export var power_up_chance: float = 0.9

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var laser_timer: Timer = $LaserTimer


var _player_ref: Player


func _ready() -> void:
	_player_ref = get_tree().get_first_node_in_group(Player.GROUP_NAME)
	if !_player_ref:
		queue_free()
