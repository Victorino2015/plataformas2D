extends Area2D

class_name Diamond

func _on_area_2d_body_entered(body):
	if body is CharacterBody2D:
		queue_free();
		$DiamondObtainSound
