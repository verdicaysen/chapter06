extends Node2D

@export var position_interpolation_speed: float = 1.0
@export var camera_distance: float = 100
@onready var _player: CharacterBody2D = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var move_direction: Vector2 = _player.velocity.normalized()
	var target_position: Vector2 = move_direction * camera_distance
	position = position.lerp(target_position, position_interpolation_speed * delta)
		
