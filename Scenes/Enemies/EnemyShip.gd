extends EnemyBase

class_name EnemyShip

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
	SpaceUtils.play_random_animation(animated_sprite_2d)
	start_shoot_timer()

func start_shoot_timer() -> void:
	SpaceUtils.set_and_start_timer(
		laser_timer,
		bullet_wait_time,
		bullet_wait_time_var
	)

func update_bullet_direction() -> void:
	if aims_at_player == false:
		return
	
	if is_instance_valid(_player_ref) == false:
		return
		
	bullet_direction = global_position.direction_to(
		_player_ref.global_position
	)

func shoot() -> void:
	if shoots_at_player == false:
		return
	update_bullet_direction() 
	SignalHub.emit_on_create_bullet(
		global_position, 
		bullet_direction,
		bullet_speed, 
		bullet_type
	)
	sound.play()
	start_shoot_timer()
	
	
func create_power_up() -> void:
	if randf() < power_up_chance:
		SignalHub.emit_on_create_powerup_random(global_position)

func die() -> void:
	create_power_up()
	super()

func _on_laser_timer_timeout() -> void:
	shoot()
