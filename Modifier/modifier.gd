@abstract
class_name Modifier
extends Resource
#
#@export var name : String
#@export var icon : Texture2D

var source

@abstract func apply(ctx:AbilityContext)
@abstract func remove(ctx:AbilityContext)
