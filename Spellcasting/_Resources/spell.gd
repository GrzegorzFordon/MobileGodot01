class_name Spell
extends Resource

@export var name : String
@export var description : String
@export var icon : Texture2D

@export var cooldown : float
@export var is_aimed : bool

@export var costs : Array[AbilityCost]
@export var requirements : Array[AbilityRequirement]

@export var on_equip_abilities : Array[Ability]
@export var abilities : Array[AbilityUse]
#TODO - visuals, animation data

func can_cast(ctx:AbilityContext)->bool:
	for req in requirements:
		if not req.is_fulfilled(ctx) : return false
	return true

func can_pay(ctx:AbilityContext)->bool:
	for cost in costs:
		if not cost.can_pay(ctx): return false
	return true

func pay(ctx:AbilityContext):
	for cost in costs:
		cost.pay(ctx)

func start(ctx:AbilityContext):
	for ability in abilities:
		ability.start_use(ctx)

func finish(ctx:AbilityContext):
	for ability in abilities:
		ability.end_use(ctx)

func on_equip(ctx:AbilityContext):
	for ability in on_equip_abilities:
		ability.resolve(ctx)

func on_unequip(ctx:AbilityContext):
	for ability in on_equip_abilities:
		ability.undo(ctx)
