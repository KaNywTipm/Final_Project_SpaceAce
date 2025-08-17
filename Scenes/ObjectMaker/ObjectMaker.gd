extends Node2D


const ADD_OBJECT: String = "add_object"
const EXPLOSION = preload("res://Scenes/Explosion/Explosion.tscn")
const POWER_UP = preload("res://Scenes/PowerUp/PowerUp.tscn")
const BULLET_BOMB = preload("res://Scenes/Bullets/BulletBomb.tscn")
const BULLET_ENEMY = preload("res://Scenes/Bullets/BulletEnemy.tscn")
const BULLET_PLAYER = preload("res://Scenes/Bullets/BulletPlayer.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalHub.on_create_explosion.connect(on_create_explosion)
	SignalHub.on_create_powerup.connect(on_create_powerup)
	SignalHub.on_create_powerup_random.connect(on_create_powerup_random)
	SignalHub.on_create_bullet.connect(on_create_bullet)

	
func add_object(obj: Node, pos: Vector2) -> void:
	add_child(obj)
	obj.global_position = pos
	
	
func on_create_powerup(pos: Vector2, pu_type: PowerUp.PowerUpType) -> void:
	var pu: PowerUp = POWER_UP.instantiate()
	pu.power_up_type = pu_type
	call_deferred(ADD_OBJECT, pu, pos)

func on_create_powerup_random(pos: Vector2) -> void:
	var rpu: PowerUp.PowerUpType = \
	 			PowerUp.PowerUpType.values().pick_random()
	on_create_powerup(pos, rpu)

func on_create_bullet(pos: Vector2, 
					dir: Vector2, 
					speed: float, 
					bu_type: BulletBase.BulletType ) -> void:
	var scene: BulletBase
	match bu_type:
		BulletBase.BulletType.Player:
			scene = BULLET_PLAYER.instantiate()
		BulletBase.BulletType.Enemy:
			scene = BULLET_ENEMY.instantiate()
		BulletBase.BulletType.Bomb:
			scene = BULLET_BOMB.instantiate()
	if scene:
		scene.setup(dir, speed)
		call_deferred(ADD_OBJECT, scene, pos)

func on_create_explosion(pos: Vector2, anim_name: String ) -> void:
	var scene: Explosion = EXPLOSION.instantiate()
	scene.setup(anim_name)
	call_deferred(ADD_OBJECT, scene, pos)
