extends StaticBody3D

@onready var anim = $"../AnimationPlayer"
@onready var slider = $"../../Slide"
@onready var vol0_1 = $"../../Volume 0_1"
@onready var vol1_2 = $"../../Volume 1_2"
@onready var vol2_3 = $"../../Volume 2_3"
@onready var vol3_4 = $"../../Volume 3_4"
@onready var vol4_5 = $"../../Volume 4_5"
@onready var vol5_0 = $"../../Volume 5_0"

var state = 4
var animLength

func _ready() -> void:
	anim.speed_scale = 0.8
	vol3_4.play()

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if event is InputEventMouseButton:
		print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
		if !anim.is_playing():
			match state:
				0:
					anim.play("Slider 1 0_1")
					state = 1
					slider.play()
					vol0_1.play()
				1:
					anim.play("Slider 1 1_2")
					state = 2
					slider.play()
					vol1_2.play()
				2:
					anim.play("Slider 1 2_3")
					state = 3
					slider.play()
					vol2_3.play()
				3:
					anim.play("Slider 1 3_4")
					state = 4
					slider.play()
					vol3_4.play()
				4:
					anim.play("Slider 1 4_5")
					state = 5
					slider.play()
					vol4_5.play()
				5:
					anim.play("Slider 1 5_0")
					state = 0
					slider.play()
					vol5_0.play()
