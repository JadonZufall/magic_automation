@tool
class_name EntitySpawn extends Marker2D

@export var entity_scene: PackedScene          ## The scene that will be spawned when entity is spawned.
@export var destroy_instances: bool = true     ## If true will call queue_free on all entity instances when spawner instance is destroyed.

@export_group("Replicate Transformation", "copy_")
@export var copy_position: bool = false
@export var copy_rotation: bool = false
@export var copy_scale: bool = false
@export var copy_skew: bool = false

var entity_instances: Array[Entity] = []


func _ready() -> void:
	if not Engine.is_editor_hint():
		call_deferred("spawn_entity")

func _get_configuration_warnings() -> PackedStringArray:
	var warnings: PackedStringArray
	if not entity_scene:
		warnings.append("No entity_scene assigned.")
	return warnings

func _notification(what: int) -> void:
	if not Engine.is_editor_hint():
		if what == NOTIFICATION_PREDELETE:
			if destroy_instances:
				_despawn_entities()

func _despawn_entities() -> void:
	for instance in entity_instances:
		instance.queue_free()

func spawn_entity() -> void:
	if entity_scene:
		if not %Entities:
			push_error("EntitySpawn: Unable to find $Level to spawn entity instance.")
			return
		var instance: Entity = entity_scene.instantiate() as Entity
		instance.spawned_by = self
		if copy_position: instance.global_position = global_position
		if copy_rotation: instance.global_rotation = global_rotation
		if copy_scale: instance.global_scale = global_scale
		if copy_skew: instance.global_skew = global_skew
		entity_instances.append(instance)
		%Entities.add_child(instance)
	else:
		push_error("EntitySpawn: No entity_scene assigned.")
