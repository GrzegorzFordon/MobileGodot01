class_name WeaponData
extends Resource

signal finished()

enum WeaponType {SWORD,BOW,STAFF,SHIELD,GUN}

@export var type : WeaponType
@export var use_data_arr : Array[AbilityUse]
@export var on_equip_effects : Array[AbilityEffect]
@export var modifiers : Array[Modifier]
@export var visuals : WeaponVisuals

#var is_attacking : bool
var combo_index : int

func start_use(ctx:AbilityContext):
	if use_data_arr.size()<combo_index: return
	use_data_arr[combo_index].start_use(ctx)
	use_data_arr[combo_index].finished.connect(_on_current_use_data_finish)

func end_use(ctx:AbilityContext):
	use_data_arr[combo_index].finished.disconnect(_on_current_use_data_finish)
	use_data_arr[combo_index].end_use(ctx)
	combo_index = (combo_index+1) % use_data_arr.size()

func on_equip(ctx:AbilityContext):
	for effect in on_equip_effects:
		effect.apply(ctx)

func on_unequip(ctx:AbilityContext):
	for effect in on_equip_effects:
		effect.undo(ctx)

func _on_current_use_data_finish():
	finished.emit()
