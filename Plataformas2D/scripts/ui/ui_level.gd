extends CanvasLayer


#nodos
@onready var diamonds_num_count : Label = $DiamondNumLabel;
@onready var live_hearts: Array[Sprite2D] = [$LiveHeard1,$LiveHeard2,$LiveHeard3];

func _ready():
	Global.ui = self;
	
func update_diamonds_count(value):
	diamonds_num_count.text = str(value);

func update_heards(value):
	for i in range(value,live_hearts.size()):
		live_hearts[i].hide();	
