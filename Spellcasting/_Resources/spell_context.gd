class_name SpellContext
extends Resource

var source : Entity
var target : Entity
var origin : Vector3 = Vector3.ZERO
var look_dir : Vector3 = Vector3.ZERO
var aim_dir : Vector2 = Vector2.ZERO

func with_data(_source:Entity,_target:Entity,_origin:Vector3,_look_dir:Vector3,_aim_dir:Vector2)->SpellContext:
	source = _source
	target = _target
	origin = _origin
	look_dir = _look_dir
	aim_dir = _aim_dir
	return self
