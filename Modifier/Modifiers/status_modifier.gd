class_name StatusModifier
extends Modifier

enum TYPE {SILENCED,FROZEN,POISONED,ROOTED,STUNNED,NIMBLE}
@export var type : TYPE

#nimble means walking sideways/backwards isn't slower
