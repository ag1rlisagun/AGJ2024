extends CanvasLayer

var current_state
# 0:
# Entered Elevator
## waiting for button input
# 1:
# Any button pressed (disable buttons after), elevator is going to the floor, 
# playing music for random amount of time (7-17 sec)
# Elevator breaks down (music stop, shake, lights down)
# Ding plays, Dinosaur starts speaking
# Dialog Dialog
# Once Dialog finished, 

# 2:
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

@onready var white_light = $AnimatedElevator/WhiteLight
@onready var red_light = $AnimatedElevator/RedLight

@onready var timer = $Timer
@onready var camera_3d = $World/SubViewportContainer/SubViewport/Camera3D

var escaping = false
var pressed = false

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
@onready var elevator_ding = $SFXPlayers/ElevatorDing

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
			
	if Input.is_action_just_pressed("Enter"):
		if pressed:
			pressed = false
			$World/Elevator/RealDino.visible = true
			$World/Elevator/ClickableDino.visible = false
			$UI/EnterPrompt.visible = false
			return
		if !pressed:
			$World/Elevator/RealDino.visible = false
			$World/Elevator/ClickableDino.visible = true
			$UI/EnterPrompt.visible = true
			pressed = true
			start_dialog("code_revealed")
			return

func handle_escape():
	escaping = true
	timer.start()

func start_dialog(timeline):
	Dialogic.timeline_ended.connect(_on_timeline_ended)
	Dialogic.start(timeline)
	if !pressed:
		$World/Elevator/Wall5/touchscreen/BlackScreen.visible = false

func _on_timeline_ended():
	Dialogic.timeline_ended.disconnect(_on_timeline_ended)
	$World/Elevator/Wall5/touchscreen/BlackScreen.visible = true
	if current_state == 1:
		print(str(current_state))
		current_state = 2
		await get_tree().create_timer(2).timeout
		$World/Elevator/RealDino.visible = true
		$World/Elevator/RealDino.gravity_scale = 1
		await get_tree().create_timer(0.7).timeout
		$SFXPlayers/PlushieDrop.play()
		await get_tree().create_timer(2).timeout
		start_dialog("after_plushie_drop")
		return
	if current_state == 2:
		current_state = 3
		
		## TURN LIGHTS BACK ON
		red_light.visible = true
		await get_tree().create_timer(0.6).timeout
		red_light.visible = false
		await get_tree().create_timer(0.6).timeout
		red_light.visible = true
		await get_tree().create_timer(0.6).timeout
		red_light.visible = false
		
		white_light.visible = true
	
		# await get_tree().create_timer(2).timeout
		start_dialog("plushie_instructions")
		return
	if current_state == 3:
		# IMPLEMENT CLICKING ON THE DINO, 360 VIEW
		# AND MAKE A TIMELINE SAYING THAT THERE's A CODE ON THE TAG
		pass
	if current_state == 4:
		we_bossin_in_this_nova.play()
		await get_tree().create_timer(2).timeout
		$AnimatedElevator.open()
		await get_tree().create_timer(2).timeout
		TransitionScene.transition()
		await TransitionScene.on_transition_finished
		get_tree().change_scene_to_file("res://Scenes/start_elevator_scene.tscn")
	


const password = "2047"
@onready var label = $UI/NumberButtons/Label

func key_press(digit):
	if len(label.text) < 4:
		label.text += str(digit)

# ELEVATOR BUTTONS
func _on_button_number_1_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(1)

func _on_button_number_2_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(2)

func _on_button_number_3_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(3)

func _on_button_number_4_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(4)

func _on_button_number_5_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(5)

func _on_button_number_6_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(6)

func _on_button_number_7_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(7)

func _on_button_number_8_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(8)

func _on_button_number_9_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(9)

func _on_button_number_0_pressed():
	SFX_key_press.play()
	choose_floor()
	if current_state == 3:
		key_press(0)

func _on_help_pressed():
	SFX_key_press.play()
	if current_state == 3:
		if label.text == password:
			print("right")
			current_state = 4
			$SFXPlayers/Success.play()
			await get_tree().create_timer(2).timeout
			start_dialog("after_code_inputted")
			$World/Elevator/Wall5/touchscreen/AnimatedSprite2D.visible = false
			$World/Elevator/Wall5/touchscreen/SadDino.visible = true
		else:
			print("wrong")
			label.text = ""

func _on_dino_pressed():
	# Dialogic.start_timeline("dino_intro")
	## IMPLEMENT DINO HOLDING HERE
	#if !pressed:
		#$World/Elevator/RealDino.visible = false
		#$World/Elevator/ClickableDino.visible = true
		#$UI/EnterPrompt.visible = true
		#pressed = true
	pass


func _on_timer_timeout():
	escaping = false
	
func choose_floor():
	if current_state == 0:
		current_state = 1
		await get_tree().create_timer(1.5).timeout
		we_bossin_in_this_nova.play()
		await get_tree().create_timer(randf_range(3, 10)).timeout
		SFX_elevator_crash.play()
		await get_tree().create_timer(2).timeout
		we_bossin_in_this_nova.stop()
		
		$World/Elevator/Wall5/touchscreen/BlackScreen.visible = false
		$World/Elevator/Wall5/touchscreen/SadDino.visible = false
		$World/Elevator/Wall5/touchscreen/AnimatedSprite2D.visible = false
		camera_3d.apply_shake()
		
		## TURN LIGHTS OFF
		white_light.visible = false
		red_light.visible = true
		await get_tree().create_timer(0.6).timeout
		red_light.visible = false
		await get_tree().create_timer(0.6).timeout
		red_light.visible = true
		await get_tree().create_timer(0.6).timeout
		red_light.visible = false
		await get_tree().create_timer(0.6).timeout
		red_light.visible = true
		await get_tree().create_timer(0.6).timeout
		red_light.visible = false
		
		# await get_tree().create_timer(3).timeout
		$World/Elevator/Wall5/touchscreen/BlackScreen.visible = true
		$World/Elevator/Wall5/touchscreen/AnimatedSprite2D.visible = true
		elevator_ding.play()
		start_dialog("dino_intro")
		return
		
		
		
		
		
		
