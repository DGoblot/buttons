extends FmodEventEmitter3D


func _on_rigid_body_3d_body_entered(body: Node) -> void:
	#print("wow")
	play()
	
