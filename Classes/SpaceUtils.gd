class_name SpaceUtils


static func toggle_area2d(area: Area2D, switch_on: bool) -> void:
	area.set_deferred("monitoring", switch_on)
	area.set_deferred("monitorable", switch_on)


static func play_random_animation(anim: AnimatedSprite2D) -> void:
	var animations: PackedStringArray = anim.sprite_frames.get_animation_names()
	anim.play(animations[randi() % animations.size()])


static func set_and_start_timer(t: Timer, wait: float, variance: float):
	t.wait_time = wait + randf_range(-variance, variance)
	t.start()
	
