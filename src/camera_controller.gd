extends Camera2D

# TODO: These all need to be moved to components
@export var debug_label: Label
@export var debug_reset: Button
@export var debug_speed: HSlider
@export var debug_speed_value: Label

@export var camera_speed: float = 1.0

func _on_debug_reset_pressed() -> void:
	print("Reset camera position")
	position = Vector2.ZERO

func _on_debug_speed_value_changed(value: float) -> void:
	camera_speed = value
	if debug_speed_value:
		debug_speed_value.text = str(camera_speed)

func _ready() -> void:
	if debug_reset:
		debug_reset.pressed.connect(_on_debug_reset_pressed)
	if debug_speed:
		debug_speed.value = camera_speed
		debug_speed.value_changed.connect(_on_debug_speed_value_changed)
	if debug_speed_value:
		debug_speed_value.text = str(camera_speed)

func _process(_delta: float) -> void:
	if debug_label:
		debug_label.text = "CameraPosition: {0}".format([str(position)])

func _physics_process(delta: float) -> void:
	var input_dir := Input.get_vector("camera_left", "camera_right", "camera_up", "camera_down")
	if input_dir:
		position += input_dir * delta * camera_speed
