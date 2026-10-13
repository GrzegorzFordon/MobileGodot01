class_name Projectile
extends Node3D

@export var data : ProjectileData
@export var on_hit_effects : Array[SpellEffect]
@export var modifier : Array[Modifier]

func on_hit(ctx):
	for effect in on_hit_effects:
		effect.execute(ctx)
