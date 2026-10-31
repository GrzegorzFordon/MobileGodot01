class_name AbilityContext
extends Resource

var source : Entity #Set at creation
var origin : Vector3 #Origin of effect (could be different from entity)
var target : Array[Entity] #Set by targetter or at creation
var context : Dictionary[String,Variant] #Added to by effects (?)
#Modifiers?

func with_data(_source:Entity,_origin:Vector3,_target:Array[Entity]=[])->AbilityContext:
	source = _source
	origin = _origin
	target = _target
	return self

func _to_string() -> String:
	return str("AbilityCTX: ",source.name,", ",origin,", ",target,", ",context)
