extends Node3D

@onready var anim = $AnimationPlayer
@onready var mesh = $"../red button2/Red Button"

func _on_rigid_body_3d_body_entered(body: Node) -> void:
	anim.play("Push")
	body.queue_free()
