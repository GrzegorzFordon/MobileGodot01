class_name WeaponController
extends Node

signal weapon_equiped(weapon:WeaponData,type:TYPE)
signal weapon_unequipped(weapon:WeaponData,type:TYPE)
signal swap_cooldown_set(cooldown:float)

enum TYPE {ACTIVE,SECONDARY}

@export var weapons : Dictionary[TYPE,WeaponData]
@export var swap_cooldown_duration : float

var entity : Entity
var swap_cooldown_timer : SceneTreeTimer
var is_attacking : bool

func _ready() -> void:
	entity = owner as Entity
	for key in weapons.keys():
		equip_weapon(weapons[key],key)

func use_weapon():
	var ctx = AbilityContext.new().with_data(entity,entity.global_position)
	weapons[TYPE.ACTIVE].start_use(ctx)
	weapons[TYPE.ACTIVE].finished.connect(_on_active_weapon_finished_use)
	is_attacking = true

func cancel_use_weapon():
	var ctx = AbilityContext.new().with_data(entity,entity.global_position)
	#var connections = weapons[TYPE.ACTIVE].finished.get_connections()
	#print(connections)
	weapons[TYPE.ACTIVE].finished.disconnect(_on_active_weapon_finished_use)
	weapons[TYPE.ACTIVE].end_use(ctx)
	is_attacking = false

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
	var ctx = AbilityContext.new().with_data(owner,owner.global_position)
	weapons[type].on_equip(ctx)
	weapon_equiped.emit(weapons[type],type)

func unequip_weapon(type:TYPE):
	if not weapons.has(type): return
	weapon_unequipped.emit(weapons[type],type)
	var ctx = AbilityContext.new().with_data(owner,owner.global_position)
	weapons[type].on_unequip(ctx)
	weapons[type] = null

func get_weapon(type:TYPE):
	if weapons.has(type): return weapons[type]

func _on_active_weapon_finished_use():
	is_attacking = false
