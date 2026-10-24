class_name Stat
extends Resource

enum TYPE {STRENGTH,SPEED,MAX_HEALTH,MAX_MANA}

signal value_changed(new_value:float)

#@export var name : String
@export var type : TYPE
@export var base_val : float
@export var min_val : float = 0.0
@export var max_val : float = 99.0

var value: float:
	get: return clampf(_get_value(),min_val,max_val)

var mod_holder: ModifierHolder

func _init() -> void:
	mod_holder = ModifierHolder.new()

func _get_value() -> float:
	var flat_bonus = 0.0
	var mult_bonus = 0.0
	for mod in mod_holder.modifiers:
		if mod is StatModifier:
			match mod.type:
				StatModifier.TYPE.FLAT: flat_bonus += mod.amount
				StatModifier.TYPE.MULT: mult_bonus += mod.amount
	var goal_val = (base_val + flat_bonus) * (1.0 + mult_bonus)
	return goal_val

func add_modifier(modifier:StatModifier):
	mod_holder.add_modifier(modifier)
	value_changed.emit(value)

func remove_modifier(modifier:StatModifier):
	mod_holder.remove_modifier(modifier)
	value_changed.emit(value)
