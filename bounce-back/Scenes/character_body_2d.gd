extends CharacterBody2D


const AIRSPEED = 300.0
const GROUNDSPEED = 100
const JUMP_VELOCITY = -750.0
const MaxJumpTime = 0.7
var jumpTime = 0
var prevSpeedY = 0
var firstGroundTouch = false
var fallTime = 0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		jumpTime += delta
		if velocity.y > 0:
			fallTime += delta
			
	if is_on_floor():
		fallTime = 0
		jumpTime = 0
		firstGroundTouch = true # you cant move on x axis until youve hit the ground for the first time
		
		
	
	if is_on_floor() and prevSpeedY>1250:
		for i in range(prevSpeedY/70):
			$Camera2D.offset = Vector2(randf_range(-1*(prevSpeedY/500),1*(prevSpeedY/500)),randf_range(-1*(prevSpeedY/500),1*(prevSpeedY/500)))	
			await get_tree().create_timer(.01).timeout

	if is_on_floor() and prevSpeedY>500:
		velocity.y = prevSpeedY/2
		
	if fallTime > 2.5:
		self.velocity.y = -1250
		fallTime = 0
		
	# Handle jump.
	if Input.is_action_just_pressed("spacebar") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_released("spacebar") and jumpTime < MaxJumpTime:
		velocity.y = 300

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	
	if direction and firstGroundTouch==true and not is_on_floor() :
		velocity.x = direction * AIRSPEED
	elif direction and is_on_floor():
		$Sprite2D.scale.x = direction * -1
		$Sprite2D/AnimationPlayer.play("hop")
		velocity.x = direction * GROUNDSPEED
	else:
		velocity.x = 0
		
	prevSpeedY = velocity.y
	$Sprite2D.scale.y = (abs(velocity.y / 4000)) + 1 
	
	move_and_slide()
