extends Node2D


func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("test"):
		#SignalHub.emit_on_create_powerup(
		#		Vector2(200,100), PowerUp.PowerUpType.Health
	#)
	#	SignalHub.emit_on_create_powerup(
	#			Vector2(300,100), PowerUp.PowerUpType.Shield
	#)
		SignalHub.emit_on_create_powerup_random(
			Vector2(400,100)
	)
		SignalHub.emit_on_create_powerup_random(
			Vector2(300,100)
	)
		SignalHub.emit_on_create_powerup_random(
			Vector2(200,100)
	)
