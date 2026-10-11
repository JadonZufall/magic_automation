@icon("uid://cq8rjn5wv8kl1")
class_name Entity extends Node2D


func get_component(cls: GDScript) -> Component:
	for child in get_children():
		if child is Component and child.get_script() == cls:
			return child
	return null
