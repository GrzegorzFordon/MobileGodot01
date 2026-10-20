class_name AbilityContext
extends Resource

var source : Entity #Set at creation
var target : Array[Entity] #Set by targetter or at creation
var context : Dictionary[String,Variant] #Added to by effects (?)
#Modifiers?

func with_data(_source:Entity,_target:Array[Entity]=[])->AbilityContext:
	source = _source
	target = _target
	return self
