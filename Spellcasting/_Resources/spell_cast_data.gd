@abstract
class_name SpellCastData
extends Resource

#enum CastType {PASSIVE,INSTANT,CAST,TOGGLE,CHANNEL}

#@export var cast_type : CastType

@abstract func start_cast(spell_data:SpellData)
@abstract func cancel_cast(spell_data:SpellData)

#@abstract func cast(spell_data:SpellData)
