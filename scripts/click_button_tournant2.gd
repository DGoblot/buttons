extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var click = $"../../Click"
@onready var ambiance = $"../../Ambiance"
var state = "on"

signal clicked 

func _ready() -> void:
	anim.speed_scale = 1.8

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			if state == "off":
				anim.play("Tournant 2 On")
				state = "on"
				click.play()
				ambiance.stop()
			else:
				anim.play("Tournant 2 Off")
				state = "off"
				ambiance.play()
				click.play()
				emit_signal("clicked")

func _on_static_body_3d_clicked() -> void:
	if state == "off":
		anim.play("Tournant 2 On")
		state = "on"
