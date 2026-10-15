class_name SpellData
extends Resource

@export var name : String
@export var description : String
@export var icon : Texture2D

@export var cooldown : float
@export var is_aimed : bool

@export var costs : Array[SpellCost]
@export var requirements : Array[SpellRequirement]
@export var effect_executions : Array[SpellExecution]
#TODO - visuals, animation data

func can_cast(ctx:SpellContext)->bool:
	for req in requirements:
		if not req.is_fulfilled(ctx) : return false
	return true

func can_pay(ctx:SpellContext)->bool:
	for cost in costs:
		if not cost.can_pay(ctx): return false
	return true

func pay(ctx:SpellContext):
	for cost in costs:
		cost.pay(ctx)

func start(ctx:SpellContext):
	for exec in effect_executions:
		exec.start(ctx)

func finish():
	for exec in effect_executions:
		exec.finish()
