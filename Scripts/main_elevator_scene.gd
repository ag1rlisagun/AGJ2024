extends CanvasLayer


@onready var timer = $Timer
var escaping = false

# BUTTONS
@onready var button_num_1 = $UI/NumberButtons/ButtonNumber1
@onready var button_num_2 = $UI/NumberButtons/ButtonNumber2
@onready var button_num_3 = $UI/NumberButtons/ButtonNumber3
@onready var button_num_4 = $UI/NumberButtons/ButtonNumber4
@onready var button_num_5 = $UI/NumberButtons/ButtonNumber5
@onready var button_num_6 = $UI/NumberButtons/ButtonNumber6
@onready var button_num_7 = $UI/NumberButtons/ButtonNumber7
@onready var button_num_8 = $UI/NumberButtons/ButtonNumber8
@onready var button_num_9 = $UI/NumberButtons/ButtonNumber9
@onready var button_num_0 = $UI/NumberButtons/ButtonNumber0
@onready var help_button = $UI/HelpButton/Help

# SFX
@onready var SFX_key_press = $SFXPlayers/KeyPress
@onready var SFX_fail_laugh = $SFXPlayers/FailLaugh
@onready var SFX_elevator_crash = $SFXPlayers/ElevatorCrash

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Esc"):
		if escaping:
			get_tree().quit()
		else:
			handle_escape()
			
	if Input.is_action_just_pressed("shake"):
		SFX_elevator_crash.play()
		SFX_fail_laugh.play()
			
func handle_escape():
	escaping = true
	timer.start()

# ELEVATOR BUTTONS
func _on_button_number_1_pressed():
	SFX_key_press.play()

func _on_button_number_2_pressed():
	SFX_key_press.play()

func _on_button_number_3_pressed():
	SFX_key_press.play()

func _on_button_number_4_pressed():
	SFX_key_press.play()

func _on_button_number_5_pressed():
	SFX_key_press.play()

func _on_button_number_6_pressed():
	SFX_key_press.play()

func _on_button_number_7_pressed():
	SFX_key_press.play()

func _on_button_number_8_pressed():
	SFX_key_press.play()

func _on_button_number_9_pressed():
	SFX_key_press.play()

func _on_button_number_0_pressed():
	SFX_key_press.play()

func _on_help_pressed():
	pass # Replace with function body.

func _on_dino_pressed():
	Dialogic.start_timeline("dino_intro")

func _on_timer_timeout():
	escaping = false
