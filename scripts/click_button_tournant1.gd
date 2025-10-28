extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var click = $"../../Click"
@onready var ambiance = $"../../Ambiance"
var state = "off"

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			if state == "off":
				anim.play("Tournant 1 On")
				state = "on"
				ambiance.play()
				click.play()
			else:
				anim.play("Tournant 1 Off")
				state = "off"
				ambiance.stop()
				click.play()
