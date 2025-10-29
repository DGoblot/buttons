extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var sonSliderB = $"../SonSlider"
@onready var lowPassOn = $"../FilterOn"
@onready var lowPassOff = $"../FilterOff"
var state = "on"

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		sonSliderB.play()
		fmod
		if !anim.is_playing():
			if state == "off":
				anim.play("Slider 2 Off")
				state = "on"
				lowPassOff.play()
			else:
				anim.play("Slider 2 On")
				state = "off"
				lowPassOn.play()

func _process(delta: float) -> void:
	if anim.is_playing():
		if state == "off":
			print(anim.current_animation_position * (1/anim.current_animation_length))
		else:
			print(1 - anim.current_animation_position * (1/anim.current_animation_length))
