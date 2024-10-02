extends Node2D

 # This is constant which means we cant do cool things like add to it to increase max health during the game. But whatever.
const MAX_HEALTH: int = 10

# Let's cache HealthLabel instead so we're improving performance. We don't need you to constantly search for the node.
@onready var _health_label: Label = $HealthLabel

# This is basically current health.
var health: int = 10

# Main scene tree function to get everything in the tree moving at game start.
func _ready():
	pass

func add_health_points(difference: int):
	health += difference
	health = clamp(health, 0, MAX_HEALTH)
	update_health_label()

func update_health_label():
	_health_label.text = str(health) + "/" + str(MAX_HEALTH)
