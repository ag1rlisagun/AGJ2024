extends Node3D

@onready var animation_player = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func open():
	animation_player.play("elevator_open")
	
func lights_off():
	pass

func lights_on():
	pass
