extends Area2D

class_name Diamond
	
@onready var obtainSound : AudioStreamPlayer = $DiamondObtainSound;
@onready var animation : AnimationPlayer = $AnimationPlayer;

func _on_body_entered(body):
	if body is Player:
		animation.play("Obtain");
		obtainSound.play();
		await get_tree().create_timer(0.20).timeout;
		queue_free();
