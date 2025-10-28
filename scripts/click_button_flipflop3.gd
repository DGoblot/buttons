extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var click = $"../../Click"
var state = "off"

signal lightGreen

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			if state == "off":
				anim.play("Flip 3")
				state = "on"
				click.play()
				emit_signal("lightGreen")
			else:
				anim.play("Flop 3")
				state = "off"
				click.play()
				emit_signal("lightGreen")
