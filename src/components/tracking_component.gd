@tool
class_name TrackingComponent extends Component


@export var target: Node2D

func _physics_process(_delta: float) -> void:
	if target:
		entity.global_position = target.global_position
