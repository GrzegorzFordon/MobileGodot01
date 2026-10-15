@abstract
class_name SpellCastData
extends Resource

@abstract func start_cast(effects:Array[SpellEffect],ctx:SpellContext)
@abstract func cancel_cast(effects:Array[SpellEffect])

func cast(effects:Array[SpellEffect],ctx:SpellContext):
	for effect in effects:
		effect.apply(ctx)
