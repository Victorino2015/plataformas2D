extends CharacterBody2D
class_name Player;
#constantes
const GRAVITY : int = 9;
#variables
var speed : int = 120;
var direction : float = 0.0;
var jump : int = 250;
#nodos
@onready var animation : AnimationPlayer = $Marker2D/AnimationPlayer;
@onready var marker : Marker2D = $Marker2D;

func _physics_process(delta):
	change_animation();
	verify_direction();
	verify_jump();
	apply_gravity();
	move_and_slide();

func verify_jump():
	if is_on_floor() and Input.is_action_pressed("ui_up"):
		velocity.y -= jump;

func apply_gravity():
	if !is_on_floor():
		velocity.y += GRAVITY;

func verify_direction():
	direction = Input.get_axis("ui_left", "ui_right");
	velocity.x = direction * speed;
	if direction < 0:
		marker.scale.x = -1;
	elif direction > 0:
		marker.scale.x = 1; 

func change_animation():
	if !is_on_floor() and velocity.y<0:
		animation.play("jump");
	elif !is_on_floor() and velocity.y>0:
		animation.play("fall");
	elif direction == 0:
		animation.play("iddle");
	else:
		animation.play("run");
