extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var slider = $"../../FmodEventEmitter3D"
var state = "off"

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			anim.speed_scale = 0.8
			if state == "off":
				anim.play("Slider 1 Off")
				state = "on"
				slider.play()
			else:
				anim.play("Slider 1 On")
				state = "off"
				slider.play()
