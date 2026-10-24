class_name Aura
extends Resource

#AURAS ARE GIVEN TO ENTITIES/ To the auraholder of the entity

@export var name : String
@export var description : String
@export var icon : Texture2D

@export var duration : float

@export var on_equip_abilities : Array[Ability] #Stuff like add modifiers
@export var reactions : Array[Reaction] #Stuff like dmg source on being hit

#func on_tick():
	#pass

func on_equip():
	var ctx = AbilityContext.new() #Where does context come from
	for ability in on_equip_abilities:
		ability.resolve(ctx)
	for reaction in reactions:
		reaction.connect_reaction()

func on_unequip():
	for reaction in reactions:
		reaction.disconnect_reaction()
