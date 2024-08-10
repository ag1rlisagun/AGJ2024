extends CanvasLayer


@onready var button_num_1 = $UI/ButtonNumber1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_button_number_1_pressed():
	Input.action_press("shake")
	Input.action_release("shake")
	
	
