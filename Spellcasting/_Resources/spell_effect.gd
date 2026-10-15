@abstract
class_name SpellEffect
extends Resource

signal finished()

@abstract func apply(ctx:SpellContext)
@abstract func undo(ctx:SpellContext)
