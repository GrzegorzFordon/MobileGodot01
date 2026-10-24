class_name ModifierHolder
extends RefCounted

signal modifier_list_changed()

@export var modifiers : Array[Modifier]

func add_modifier(modifier:Modifier):
	modifiers.append(modifier)
	modifier_list_changed.emit()

func remove_modifier(modifier:Modifier):
	modifiers.erase(modifier)
	modifier_list_changed.emit()
