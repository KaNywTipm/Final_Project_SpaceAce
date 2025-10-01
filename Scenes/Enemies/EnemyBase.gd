extends PathFollow2D

class_name EnemyBase

@export var points: int = 10
@export var crash_damage: int = 10


@onready var booms: Node2D = $Booms
@onready var health_bar: HealthBar = $HealthBar
@onready var sound: AudioStreamPlayer2D = $Sound


var _speed: float = 50


func _process(delta: float) -> void:
	progress += _speed * delta
	if progress_ratio > 0.99:
		queue_free()
	

func make_booms() -> void:
	for b in booms.get_children():
		SignalHub.emit_on_create_explosion(
			b.global_position, 
			Explosion.BOOM
		)

func die() -> void:
	make_booms()
	queue_free()

func _on_health_bar_died() -> void:
	ScoreManager.increment_score(points)
	die()


func _on_hit_box_area_entered(area: Area2D) -> void:
	if area is BulletBase:
		health_bar.take_damage(area.get_damage())
