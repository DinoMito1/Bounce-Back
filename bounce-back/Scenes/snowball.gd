extends Node2D
@export var movementspeed = 300
@export var direction = 1
var startpos = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	startpos = self.position.x

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.rotation_degrees += 180 * delta * direction
	self.position.x += movementspeed * delta * direction
	if abs(startpos - self.position.x) > 1500:
		self.position.x = startpos
	


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D:
		print('push')
		body.position.y -= 20
		for i in range(50):
			body.position.x += (movementspeed / 100) * direction
			await get_tree().create_timer(.002).timeout
