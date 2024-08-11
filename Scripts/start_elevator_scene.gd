extends CanvasLayer


var started

@onready var timer = $Timer
var escaping = false

@onready var animation_player = $AnimationPlayer

# SFX
@onready var key_press = $SFXPlayers/KeyPress
@onready var SFX_elevator_ding = $SFXPlayers/ElevatorDing

func _ready():
	started = false

func _process(delta):
	if Input.is_action_just_pressed("Esc"):
		if escaping:
			get_tree().quit()
		else:
			handle_escape()

func handle_escape():
	escaping = true
	timer.start()
	
	Dialogic._on_timeline_ended()

func _on_start_button_pressed():
	key_press.play()
	if !started:
		started = true
		await get_tree().create_timer(randf_range(3, 10)).timeout
		SFX_elevator_ding.play()
		# animation_player.play("1_elevator_door")
		$World/Node3D/AnimatedElevator.open()
		await get_tree().create_timer(1.5).timeout
		TransitionScene.transition()
		await TransitionScene.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/main_elevator_scene.tscn")

func _on_timer_timeout():
	escaping = false
	
func open_doors():
	pass
