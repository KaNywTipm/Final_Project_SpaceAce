extends Control


@onready var health_bar: HealthBar = $ColorRect/MarginContainer/HealthBar

func _enter_tree() -> void:
	SignalHub.on_player_hit.connect(on_player_hit)

func on_player_hit(v: int) -> void:
	health_bar.take_damage(v)

func _on_health_bar_died() -> void:
	print("Player died")
