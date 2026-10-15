class_name ToggleCast
extends SpellCastData

var is_on : bool

func start_cast(effects:Array[SpellEffect],ctx:SpellContext):
	is_on = !is_on

func cancel_cast(effects:Array[SpellEffect]):
	pass
