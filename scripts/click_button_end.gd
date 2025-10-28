extends StaticBody3D

@onready var blackScreen = $"../../../../ColorRect"
@onready var label = $"../../../../ColorRect/Label"
@onready var animBox = $"../../../boite v2/AnimationPlayer"
@onready var animButton = $"../../AnimationPlayer"
var current_step := 0
var t_total = 0.0
var t_fade = 0.0
var speed = 1.0
var text_appear = 1.5

var end = false

func _ready() -> void:
	blackScreen.color = Color(Color.BLACK, 0.0)
	blackScreen.visible = false
	label.text = ""
	label.visible = false

func _input_event(camera, event, click_position, click_normal, shape_idx):
	if !end:
		if event is InputEventMouseButton and event.pressed:
			print("Mouse click/unclicked at: ", event.position, " shape:", shape_idx)
			match current_step:
				0:
					animBox.play("Open Up")
					current_step = 1
				1:
					animButton.play("Push Bouton Rouge")
					current_step = 2
					end = true
					blackScreen.visible = true
			
			
func _process(delta: float) -> void:
	if !end:
		t_total += delta
	if end:
		t_fade += delta * speed
		blackScreen.color = Color(Color.BLACK, t_fade)
		if t_fade > text_appear:
			label.visible = true
			label.text = str(t_total).pad_decimals(2)
		
		
