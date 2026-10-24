@abstract
class_name Reaction
extends Resource

@export var abilities : Array[Ability]

@abstract func connect_reaction()
@abstract func disconnect_reaction()

func react():
	var ctx = AbilityContext.new() #TODO - where do reactions get context
	for ability in abilities: ability.resolve(ctx)
