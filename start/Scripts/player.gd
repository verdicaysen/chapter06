extends CharacterBody2D

 # This is constant which means we cant do cool things like add to it to increase max health during the game. But whatever.
const MAX_HEALTH: int = 10

# Let's cache HealthLabel instead so we're improving performance. We don't need you to constantly search for the node.
@onready var _health_label: Label = $HealthLabel
@export var max_speed: float = 500.0
@export var acceleration: float = 2500.0
@export var deceleration: float = 1500.0

# This is basically current health.
@export var health: int = 10:
	get:
		return health
	set(new_value):
		health = clamp(new_value, 0, MAX_HEALTH)
		update_health_label()

# Main scene tree function to get everything in the tree moving at game start.
func _ready():
	print(health)
	update_health_label()
	
func _physics_process(delta: float):
	var input_direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	if input_direction != Vector2.ZERO:
		velocity = velocity.move_toward(input_direction * max_speed, acceleration * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, deceleration * delta)
	move_and_slide()

# We are adding health points via a function, and clamping it to the maximum health constant, then updating it in the UI with the update health label function.
func add_health_points(difference: int):
	health += difference

# This is a function to update the string in Health Label to the accurate number based on the variables.
func update_health_label():
	if not is_instance_valid(_health_label):
		return
		
	_health_label.text = str(health) + "/" + str(MAX_HEALTH)
