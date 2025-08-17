extends Node2D


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("test"):
		SignalHub.emit_on_create_explosion(
			Vector2(100,200), 
			Explosion.BOOM)
		SignalHub.emit_on_create_explosion(
			Vector2(200,300), 
			Explosion.EXPLODE)
