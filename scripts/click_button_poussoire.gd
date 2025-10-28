extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var fmod = $"../../FmodEventEmitter3D"

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			anim.play("Push Poussoire 1")
			fmod.play()
