extends Camera2D


const SHAKE_RANGE: Vector2 = Vector2(-3.0,3.0)
const SHAKE_TIME: float = 0.3


# Called when the node enters the scene tree for the first time.
func _ready():
	SignalHub.on_player_hit.connect(on_player_hit)
	set_process(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	offset = Vector2(
		get_random_shake_amount(), 
		get_random_shake_amount(),
	)


func get_random_shake_amount() -> float:
	return randf_range(SHAKE_RANGE.x, SHAKE_RANGE.y)


func on_player_hit(_v: int) -> void:
	set_process(true)
	await get_tree().create_timer(SHAKE_TIME).timeout
	set_process(false)
	offset = Vector2.ZERO
