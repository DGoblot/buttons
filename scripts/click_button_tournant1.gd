extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var click = $"../../Click"
@onready var ambiance = $"../../Ambiance"
@onready var pictures = $"../../Pictures"
var state = "off"
var t = 0
var speed = 2.0
var done = true
var up = false
var down = false

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			if state == "off":
				anim.play("Tournant 1 On")
				state = "on"
				ambiance.play()
				click.play()
				up = true
				t = 0
			else:
				anim.play("Tournant 1 Off")
				state = "off"
				ambiance.stop()
				click.play()
				down = true
				t = 0
				

func _process(delta: float) -> void:
	if up == true:
		t += delta * speed
		pictures.position.y = lerp(-1.0, 0.8, clampf(t,0.0,1.0))
	if down == true:
		t += delta * speed
		pictures.position.y = lerp(0.8, -1.0, clampf(t,0.0,1.0))
	if t > speed:
		up = false
		down = false
