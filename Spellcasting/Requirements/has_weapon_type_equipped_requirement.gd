class_name HasWeaponTypeEquippedRequirement
extends SpellRequirement

@export var weapon_type : WeaponData.WeaponType

func is_fulfilled(ctx:SpellContext)->bool:
	var cur_weapon = ctx.source.weapon_controller
	if not cur_weapon: return false
	return cur_weapon.active_weapon.type == weapon_type
