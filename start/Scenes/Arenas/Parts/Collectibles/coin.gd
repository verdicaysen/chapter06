extends Collectible


func _on_area_2d_body_entered(body: Node2D) -> void:
	body.coins += 1
	queue_free()
