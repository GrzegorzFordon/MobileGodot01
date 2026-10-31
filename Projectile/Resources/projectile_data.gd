class_name ProjectileData
extends Resource

@export var speed : int
@export var duration : float
@export var movement : ProjectileMovement
@export var is_penetrating : bool

@export var on_hit_effects : Array[AbilityEffect]
@export var modifier : Array[Modifier]
