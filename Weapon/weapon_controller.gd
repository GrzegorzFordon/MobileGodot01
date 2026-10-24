class_name WeaponController
extends Node

signal weapon_equiped(weapon:WeaponData,type:TYPE)
signal weapon_unequipped(weapon:WeaponData,type:TYPE)
signal swap_cooldown_set(cooldown:float)

enum TYPE {ACTIVE,SECONDARY}

@export var weapons : Dictionary[TYPE,WeaponData]
@export var swap_cooldown_duration : float

var swap_cooldown_timer : SceneTreeTimer

func use_weapon():
	weapons[TYPE.ACTIVE].start_use()

func cancel_use_weapon():
	weapons[TYPE.ACTIVE].end_use()

func swap_weapons():
	if swap_cooldown_timer and swap_cooldown_timer.time_left: return
	swap_cooldown_timer = get_tree().create_timer(swap_cooldown_duration)
	var temp_weapon = weapons[TYPE.ACTIVE]
	equip_weapon(weapons[TYPE.SECONDARY],TYPE.ACTIVE)
	equip_weapon(temp_weapon,TYPE.SECONDARY)

func equip_weapon(new_weapon:WeaponData,type:TYPE):
	if not new_weapon: return
	unequip_weapon(type)
	weapons[type] = new_weapon
	weapons[type].on_equip()
	weapon_equiped.emit(weapons[type],type)

func unequip_weapon(type:TYPE):
	if not weapons.has(type): return
	weapon_unequipped.emit(weapons[type],type)
	weapons[type].on_unequip()
	weapons[type] = null
