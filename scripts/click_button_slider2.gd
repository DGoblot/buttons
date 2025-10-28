extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
var state = "on"

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			if state == "off":
				anim.play("Slider 2 Off")
				state = "on"
			else:
				anim.play("Slider 2 On")
				state = "off"
