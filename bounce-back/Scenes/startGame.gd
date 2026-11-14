extends Node2D
@onready var started = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$FallingRock.hide()
	$BG2.hide()
	$BG.show()
	#$PressSpace/AnimationPlayer.play("spacebar_move")
	pass




# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("spacebar") and started==false:
		started=true
		$PressSpace/AnimationPlayer.stop()
		$PressSpace.texture = load("res://Sprites/OtherStuff/pressSpacePls2.png")
		
		get_tree().create_tween().tween_property($PressSpace, "modulate", Color(1,1,1,0), 1.75)
		await get_tree().create_timer(2.75).timeout
		for i in range(50):
			$Camera2D.offset = Vector2(randf_range(-1,1),randf_range(-1,1))
			
			await get_tree().create_timer(.015).timeout
		$Camera2D.offset = Vector2(0,0)
		$BG.hide()
		$BG2.show()
		$FallingRock.show()
		$FallingRock/AnimationPlayer.play("im_falling")
		
		await get_tree().create_timer(4.5).timeout
		get_tree().create_tween().tween_property($FadeOutBox, "modulate", Color(1,1,1,1), 1.1)
		await get_tree().create_timer(1.15).timeout
		get_tree().change_scene_to_file("res://Scenes/mainGame.tscn")
		
