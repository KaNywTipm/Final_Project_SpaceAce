extends Node2D


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("test"):
		#SignalHub.emit_on_create_bullet(
			#Vector2(315, 300),
			#Vector2.DOWN,
			#100.0,
			#BulletBase.BulletType.Enemy
		#)
		SignalHub.emit_on_create_powerup(
			Vector2(315,300), 
			PowerUp.PowerUpType.Shield
		)
