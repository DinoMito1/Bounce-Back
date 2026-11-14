extends Node2D
@onready var crushed = preload("res://Sprites/OtherStuff/snowPuffcrushed.png")
@onready var normal = preload("res://Sprites/OtherStuff/snowPuff.png")
@export var bouncestrengthx = 0
@export var bouncestrengthy = 1000
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print('boing')
		$Sprite2D.texture = crushed
		await get_tree().create_timer(.15).timeout
		$Sprite2D.texture = normal
		Global.boucePadHitSpeedy = bouncestrengthy
		Global.boucePadHitSpeedx = bouncestrengthx

		
