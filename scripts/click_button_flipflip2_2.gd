extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var tick = $"../Tick"
@onready var pitchPlus = $"../PitchPlus"

var state = "on"
var pitchState = 2

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			tick.play()
			if state == "off":
				anim.play("Flip2")
				state = "on"
				pitchPlus.play()
			else:
				anim.play("Flop2")
				state = "off"
				pitchPlus.play()
