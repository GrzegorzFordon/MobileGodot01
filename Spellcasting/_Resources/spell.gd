class_name Spell
extends Resource

@export var name : String
@export var description : String
@export var icon : Texture2D

@export var cooldown : float
@export var is_aimed : bool

#Activation Costs and Requirements
@export var costs : Array[AbilityCost]
@export var requirements : Array[AbilityRequirement]

@export var casts : Array[SpellCast]

#TODO - visuals, animation data
#TODO - how to pass current aim-dir to spell
#TODO - how to go on cooldown - spell has one global cooldown

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
	for cast in casts:
		cast.start_cast(ctx)

func finish():
	for cast in casts:
		cast.cancel_cast()
