extends ColorRect

@onready var button1 = $Accept1
@onready var button2 = $Accept2
@onready var label = $Label
var starting = false
var t_fade = 0
var speed = 1.0

func done():
	starting = true

func _process(delta: float) -> void:
	if starting == true:
		t_fade += delta * speed
		color = Color(color, 1- t_fade)
		label.visible = false
		button1.visible = false
		button2.visible = false
	if t_fade > speed:
		queue_free()


func _on_accept_1_pressed() -> void:
	done()


func _on_accept_2_pressed() -> void:
	done()
