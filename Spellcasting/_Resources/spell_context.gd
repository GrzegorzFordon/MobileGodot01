class_name SpellContext
extends Resource

enum CONTEXT {DAMAGE_DEALT}

var source : Entity
var origin : Vector3 = Vector3.ZERO
var look_dir : Vector3 = Vector3.ZERO
var aim_dir : Vector2 = Vector2.ZERO

var target : Array[Entity]
var data_dict : Dictionary[CONTEXT,Variant]

func with_data(_source:Entity,_origin:Vector3,_look_dir:Vector3,_aim_dir:Vector2)->SpellContext:
	source = _source
	origin = _origin
	look_dir = _look_dir
	aim_dir = _aim_dir
	return self
