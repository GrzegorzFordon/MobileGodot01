class_name Spellcaster
extends Node

@export var active_spell:SpellData

func cast_active_spell():
	var ctx = get_context()
	var can_cast = active_spell.can_cast(ctx)
	if can_cast: active_spell.cast(ctx)

func get_context()->SpellContext:
	var ctx = SpellContext.new()
	return ctx
