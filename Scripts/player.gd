extends CharacterBody2D
class_name EvansSuperSpecialCharacterBody2D

@export var speed = 300.0
@export var jump_velocity = -400.0
@export var flip_sprite = false
var sprite_node: Sprite2D

# runs once this node has loaded into the scene
func _ready() -> void:
	sprite_node = get_node("MySprite")
	pass

# runs once every frame
func _process(delta: float) -> void:
	
	if (flip_sprite):
		sprite_node.flip_v
		flip_sprite = false
	
	pass

# runs exactly 60 times per second (frequency can be changed in project settings)
func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_velocity

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)

	move_and_slide()
	
