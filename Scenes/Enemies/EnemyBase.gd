extends PathFollow2D

class_name EnemyBase

@export var points: int = 10
@export var crash_damage: int = 10


@onready var booms: Node2D = $Booms

var _speed: float = 50


func _process(delta: float) -> void:
	pass
	


func make_booms() -> void:
	for b in booms.get_children():
		SignalHub.emit_on_create_explosion(
			b.global_position, 
			Explosion.BOOM
		)



func _on_health_bar_died() -> void:
	pass # Replace with function body.


func _on_hit_box_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
