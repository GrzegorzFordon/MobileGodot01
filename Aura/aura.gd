@abstract
class_name Aura
extends Resource

#AURAS ARE GIVEN TO ENTITIES

@export var name : String
@export var description : String
@export var icon : Texture2D

@abstract func on_tick()
@abstract func on_equip()
@abstract func on_unequip()
