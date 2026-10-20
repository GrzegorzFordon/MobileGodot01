class_name HasWeaponTypeEquippedRequirement
extends AbilityRequirement

@export var weapon_type : WeaponData.WeaponType

func is_fulfilled(ctx:AbilityContext)->bool:
	var cur_weapon = ctx.source.weapon_controller.active_weapon
	if not cur_weapon: return false
	return cur_weapon.type == weapon_type
