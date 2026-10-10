class_name SpellData
extends Resource

@export var name := "BaseSpell"
@export var description := "Base Description"
@export var icon : Texture2D

@export var cooldown:=1.0

@export var requirements : Array[SpellRequirement]
@export var effects : Array[SpellEffect]

@export var target_type : SpellTarget

func can_cast(ctx:SpellContext)->bool:
	for req in requirements:
		if not req.is_fulfilled(ctx) : return false
	return true

func cast(ctx:SpellContext):
	for effect in effects:
		effect.execute(ctx)
