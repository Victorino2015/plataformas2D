extends CharacterBody2D


const GRAVITY : int = 9;

var speed : int = 120;
var direction : float = 0.0;
var jump : int = 250;

@onready var animation : AnimationPlayer = $AnimationPlayer;
@onready var sprite : Sprite2D = $Sprite2D;

func _physics_process(delta):
	direction = Input.get_axis("ui_left", "ui_right");
	velocity.x = direction * speed;
	
	if direction == 0:
		animation.play("iddle");
	else:
		animation.play("run");
	
	if is_on_floor() and Input.is_action_just_pressed("ui_up"):
		velocity.y -= jump;
	if !is_on_floor():
		velocity.y += GRAVITY; 
	
	sprite.flip_h = direction < 0 if direction != 0 else sprite.flip_h;
	
	move_and_slide();
