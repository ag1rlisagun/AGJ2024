extends Camera3D

@export var randomStrength:  float = 5.0
@export var shakeFade: float = 5.0

var rng = RandomNumberGenerator.new()

var shake_strength: float = 0.0

func apply_shake():
	shake_strength = randomStrength

#Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# change the shaking trigger when like player reach the area
	if Input.is_action_just_pressed("shake"):
		apply_shake()

	if shake_strength > 0: 
		shake_strength = lerpf(shake_strength, 0, shakeFade * delta)
		h_offset = rng.randf_range(-shake_strength, shake_strength)
		v_offset = rng.randf_range(-shake_strength, shake_strength) 
