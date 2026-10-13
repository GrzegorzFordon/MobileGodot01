class_name SpellData
extends Resource

@export var name : String
@export var description : String
@export var icon : Texture2D

@export var cooldown : float
@export var is_aimed : bool

@export var cast_data : Array[SpellCastData]
@export var targets : SpellTarget
@export var costs : Array[SpellCost]
@export var requirements : Array[SpellRequirement]
@export var effects : Array[SpellEffect]

func can_cast(ctx:SpellContext)->bool:
	for req in requirements:
		if not req.is_fulfilled(ctx) : return false
	return true

func cast(ctx:SpellContext):
	for target in targets.get_targets(ctx):
		#ctx.target = target
		for effect in effects:
			effect.execute(ctx)
