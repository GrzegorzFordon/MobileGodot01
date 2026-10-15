class_name SpellExecution
extends Resource

@export var cast_data : SpellCastData
@export var targets : SpellTarget
@export var effects : Array[SpellEffect]

func start(ctx:SpellContext):
	ctx.target = targets.get_targets(ctx)
	cast_data.start_cast(effects,ctx)

func finish():
	cast_data.cancel_cast(effects)
