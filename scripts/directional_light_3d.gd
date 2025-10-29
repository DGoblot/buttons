extends DirectionalLight3D

@onready var cigales = $"../CIGALES"
@onready var pacigales = $"../CigalesStop"

var onBlue = false
var changingBlue = false
var onGreen = false
var changingGreen = false
var onRed = false
var changingRed = false
var speedBlue = 5.0
var tBlue = 0
var speedGreen = 5.0
var tGreen = 0
var speedRed = 0.5
var tRed = 0
var cigalesPlaying = false

func _process(delta: float) -> void:
	if changingBlue:
		tBlue += delta * speedBlue
		if onBlue:
			light_color.b = lerp(1, 0, tBlue)
		if !onBlue:
			light_color.b = lerp(0, 1, tBlue)
		if tBlue > 1:
			changingBlue = false
	if changingGreen:
		tGreen += delta * speedGreen
		if onGreen:
			light_color.g = lerp(1, 0, tGreen)
		if !onGreen:
			light_color.g = lerp(0, 1, tGreen)
		if tGreen > 1:
			changingGreen = false
	if changingRed:
		tRed += delta * speedRed
		if onRed:
			light_color.r = lerp(1, 0, tRed)
		if !onRed:
			light_color.r = lerp(0, 1, tRed)
		if tRed > 1:
			changingRed = false
	if light_color.b < 1 and light_color.r < 1 and light_color.g < 1:
		if cigalesPlaying == false:
			playCigales()
			cigalesPlaying = true

	elif light_color.b > 0 or  light_color.r > 0 or  light_color.g > 0:
		if cigalesPlaying == true:
			stopCigales()
			cigalesPlaying = false



func _on_static_body_3d_light_blue() -> void:
	if onBlue:
		onBlue = false
	else:
		onBlue = true
	tBlue = 0.0
	changingBlue = true


func _on_static_body_3d_light_green() -> void:
	if onGreen:
		onGreen = false
	else:
		onGreen = true
	tGreen = 0.0
	changingGreen = true


func _on_static_body_3d_light_red() -> void:
	if onRed:
		onRed = false
	else:
		onRed = true
	tRed = 0.0
	changingRed = true

func playCigales():
	if cigalesPlaying == false:
		cigales.play()
		
func stopCigales():
	if cigalesPlaying == true:
		pacigales.play()
