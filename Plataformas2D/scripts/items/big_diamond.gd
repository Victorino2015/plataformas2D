extends Area2D

class_name Diamond
	

func _on_body_entered(body):
	if body is Player:
		$DiamondObtainSound.play();
		hide();
		await get_tree().create_timer(0.20).timeout;
		queue_free();
