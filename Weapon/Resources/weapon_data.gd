class_name WeaponData
extends Resource

enum WeaponType {SWORD,BOW,STAFF,SHIELD,GUN}

@export var type : WeaponType
#@export var use_data : WeaponUse
@export var use_data : AbilityUse
@export var on_equip_effects : Array[AbilityEffect]
@export var modifiers : Array[Modifier]
@export var visuals : WeaponVisuals

func start_use(ctx:AbilityContext):
	use_data.start_use(ctx)

func end_use(ctx:AbilityContext):
	use_data.end_use(ctx)

func on_equip():
	var ctx = AbilityContext.new() #TODO - get context?
	for effect in on_equip_effects:
		effect.apply(ctx)

func on_unequip():
	var ctx = AbilityContext.new() #TODO - get context?
	for effect in on_equip_effects:
		effect.undo(ctx)
