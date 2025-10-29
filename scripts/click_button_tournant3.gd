extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var click = $"../../Click"
var state = "on"

signal lightRed

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			if state == "off":
				anim.play("Tournant 3 On")
				state = "on"
				click.play()
				emit_signal("lightRed")
			else:
				anim.play("Tournant 3 Off")
				state = "off"
				click.play()
				emit_signal("lightRed")
