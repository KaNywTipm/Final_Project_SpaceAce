extends Node


signal on_player_hit(v: int)
signal on_score_updated(v: int)
signal on_create_explosion(pos: Vector2, anim_name: String)

func emit_on_player_hit(v: int) -> void:
	on_player_hit.emit(v)


func emit_on_score_updated(v: int):
	on_score_updated.emit(v)


func emit_on_create_explosion(pos: Vector2, anim_name: String):
	on_create_explosion.emit(pos, anim_name)
