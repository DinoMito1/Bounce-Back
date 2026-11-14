extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print('ouch')
		body.position.y -= 10
		for i in range(10):
			body.position.x += 5 * body.get_child(0).scale.x
			await get_tree().create_timer(.001).timeout
