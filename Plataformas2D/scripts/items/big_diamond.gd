extends Area2D

class_name Diamond
	

func _on_body_entered(body):
	if body is Player:
		print('entra');
		queue_free();
		$DiamondObtainSound
