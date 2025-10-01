extends EnemyBase


class_name Saucer


@onready var shoot_timer: Timer = $ShootTimer
@onready var hit_box: Area2D = $HitBox


var _shooting: bool = false
var _dead: bool = false


func _process(delta: float) -> void:
	if !_shooting:
		super(delta)


func set_shooting(s: bool) -> void:
	_shooting = s


func fire_missle() -> void:
	SignalHub.emit_on_create_homing_missile(global_position)
	

	
func _on_health_bar_died() -> void:
	_dead = true
	shoot_timer.stop()
	set_process(false)
	SpaceUtils.toggle_area2d(hit_box, false)
	ScoreManager.increment_score(points)


func _on_shoot_timer_timeout() -> void:
	set_shooting(true)


func _on_animation_tree_animation_finished(anim_name: StringName) -> void:
	if anim_name == "die":
		die()
