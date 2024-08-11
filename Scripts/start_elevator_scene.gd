extends CanvasLayer

@onready var timer = $Timer
var escaping = false


func _process(delta):
	if Input.is_action_just_pressed("Esc"):
		if escaping:
			get_tree().quit()
		else:
			handle_escape()

func handle_escape():
	escaping = true
	timer.start()

func _on_start_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_elevator_scene.tscn")

func _on_timer_timeout():
	escaping = false
