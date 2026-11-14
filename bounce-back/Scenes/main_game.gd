extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Player/CharacterBody2D.velocity.y = 1400
	await get_tree().create_timer(.3).timeout
	var tween = get_tree().create_tween()
	tween.tween_property($Player/CharacterBody2D/Camera2D,"zoom",Vector2(1,1), 1)
	tween.tween_property($Player/CharacterBody2D/Camera2D,"offset",Vector2(0,0), .5)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
