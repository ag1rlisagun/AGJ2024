extends CanvasLayer

var current_state
# 0:
# Entered Elevator
## waiting for button input
# 1:
# Any button pressed (disable buttons after), elevator is going to the floor, 
# playing music for random amount of time (7-17 sec)

# 2:
# Elevator breaks down (music stop, shake, lights down)
# Ding plays, Dinosaur starts speaking
# Dialog Dialog
# Once Dialog finished, 
# Dino drops down
## IMPLEMENT: RIGHT CLICK ON DINO TO VIEW AS OBJECT THAT ROTATES
# Dialog
# Light turns on
# Dialog
# 2:
# Puzzle state UNSOLVED
## Waiting for number input again
# if input correct
# make a number of tries? if failed then death? 
# and back to the beginning
# 3: 
# Dialog, music
# Going to another floor
# crashes again?
# lights off and touchpad lights up
# new minigame (something we make in 2d)

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

# Music
@onready var we_bossin_in_this_nova = $MusicPlayers/WeBossinInThisNova
@onready var death_music = $MusicPlayers/DeathMusic


# Called when the node enters the scene tree for the first time.
func _ready():
	current_state = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("Esc"):
		if escaping:
			get_tree().quit()
		else:
			handle_escape()
			
	if Input.is_action_just_pressed("shake"):
		await get_tree().create_timer(1).timeout
		SFX_elevator_crash.play()
		# SFX_fail_laugh.play()
			
func handle_escape():
	escaping = true
	timer.start()

const password = "1234"
@onready var label = $UI/NumberButtons/Label

func key_press(digit):
	if len(label.text) < 4:
		label.text += str(digit)

# ELEVATOR BUTTONS
func _on_button_number_1_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(1)

func _on_button_number_2_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(2)

func _on_button_number_3_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(3)

func _on_button_number_4_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(4)

func _on_button_number_5_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(5)

func _on_button_number_6_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(6)

func _on_button_number_7_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(7)

func _on_button_number_8_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(8)

func _on_button_number_9_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(9)

func _on_button_number_0_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 2:
		key_press(0)

func _on_help_pressed():
	SFX_key_press.play()
	if label.text == password:
		print("right")
	else:
		print("wrong")
		label.text = ""

func _on_dino_pressed():
	Dialogic.start_timeline("dino_intro")

func _on_timer_timeout():
	escaping = false
	
func choose_floor():
	if current_state == 0:
		current_state = 1
		we_bossin_in_this_nova.play()
		await get_tree().create_timer(randf_range(3, 10)).timeout
		we_bossin_in_this_nova.stop()
		Input.action_press("shake")
		Input.action_release("shake")
