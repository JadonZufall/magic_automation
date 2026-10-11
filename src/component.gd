@abstract
@icon("uid://dqb6wu6a1srdo")
class_name Component extends Node


var entity: Entity:
	get():
		return get_parent() as Entity
