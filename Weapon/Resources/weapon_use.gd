@abstract
class_name WeaponUse
extends Resource

@export var animation_name : String
@export var on_use_effects : Array[AbilityEffect]
var used_duration : float



@abstract func start_use()
@abstract func end_use()
@abstract func use()
