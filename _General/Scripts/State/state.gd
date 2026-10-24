@abstract
class_name State
extends Resource

signal transition(state:State,data:Dictionary)

var actor : Entity

@abstract func enter()
@abstract func exit()
@abstract func tick(delta)
@abstract func physics_tick(delta)
