extends CanvasLayer

signal on_transition_finished

@onready var color_rect = $ColorRect
@onready var animation_player = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	color_rect.visible = false
	animation_player.animation_finished.connect(_on_animation_finished)
	
func _on_animation_finished(anim_name):
	if anim_name == "fade_to_black":
		on_transition_finished.emit()
		print("Transition Finished")
		animation_player.play("fade_from_black")
	elif anim_name == "fade_from_black":
		color_rect.visible = false
		print("Transitioning..")
	
	
func transition():
	color_rect.visible = true
	animation_player.play("fade_to_black")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

