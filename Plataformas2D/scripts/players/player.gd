extends CharacterBody2D
class_name Player;

# Constantes
const GRAVITY : int = 15
const MAX_JUMP_TIME : float = 0.2  # Tiempo máximo que puede durar el salto

# Variables
var speed : int = 120
var direction : float = 0.0
var jump : int = 250
var jump_time : float = 0.0
var is_jumping : bool = false
var is_attacking : bool = false;

#nodos
@onready var animation : AnimationPlayer = $Marker2D/AnimationPlayer;
@onready var marker : Marker2D = $Marker2D;

func _physics_process(delta):
	apply_gravity();
	
	if !is_attacking:
		verify_direction();
		verify_jump(delta);
		move_and_slide();
		verify_attack();
	else:
		animation.play("attack");
		await(animation.animation_finished);
		is_attacking = false;
	
	change_animation();

#Salta en función de cuanto pulses la tecla.
func verify_jump(delta):
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			velocity.y -= jump
			is_jumping = true
			jump_time = 0.0

	if is_jumping:
		if Input.is_action_pressed("ui_up") and jump_time < MAX_JUMP_TIME:
			jump_time += delta
			velocity.y = -jump
		else:
			is_jumping = false

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

func verify_attack():
	if is_on_floor() and Input.is_action_just_pressed("attack"):
		is_attacking = true;
