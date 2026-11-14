extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		await get_tree().create_timer(.2).timeout
		$Sprite2D.texture = load("res://Sprites/platforms/longIcePlatformBreak.png")
		await get_tree().create_timer(1).timeout
		get_tree().create_tween().tween_property($".", "scale", Vector2(1,0),.2)
		$Sprite2D/StaticBody2D/CollisionShape2D.disabled = true
