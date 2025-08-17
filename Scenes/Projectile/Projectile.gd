extends Area2D


class_name Projectile


@export var damage: int = 10


func get_damage() -> int:
	return damage


func blow_up() -> void:
	set_process(false)
	queue_free()


func _on_area_entered(area: Area2D) -> void:
	blow_up()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
