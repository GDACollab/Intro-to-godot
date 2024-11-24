extends CharacterBody2D
class_name EvansSuperSpecialCharacterBody2D

@export var SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

# runs once this node has loaded into the scene
func _ready() -> void:
	pass

# runs once every frame
func _process(delta: float) -> void:
	
	pass

# runs exactly 60 times per second (frequency can be changed in project settings)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
