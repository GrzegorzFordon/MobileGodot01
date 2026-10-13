class_name WeaponData
extends Resource

enum WeaponType {SWORD, BOW, STAFF}

@export var type : WeaponType
@export var on_equip_effects : Array[SpellEffect]
@export var on_use_effects : Array[SpellEffect]
@export var modifiers : Array[Modifier]

func use():
	for effect in on_use_effects:
		effect.execute(null) #TODO - needs context
	pass

func on_equip():
	pass

func on_unequip():
	pass
