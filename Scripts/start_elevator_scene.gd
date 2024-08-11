extends CanvasLayer

@onready var timer = $Timer
var escaping = false

#SFX
@onready var SFX_elevator_ding = $SFXPlayers/ElevatorDing

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
	await get_tree().create_timer(randf_range(3, 10)).timeout
	SFX_elevator_ding.play()
	await get_tree().create_timer(1.50).timeout
	get_tree().change_scene_to_file("res://Scenes/main_elevator_scene.tscn")

func _on_timer_timeout():
	escaping = false
