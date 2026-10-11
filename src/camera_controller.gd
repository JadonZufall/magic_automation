extends Camera2D


func _process(delta: float) -> void:
	var input_dir := Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down")
	if input_dir:
		position += input_dir * delta
