class_name Entity
extends CharacterBody3D

enum RESOURCE_TYPE {HEALTH,MANA,ENERGY,RANGE}

#Components
@export var state_machine: StateMachine
@export var movement: Movement
@export var hurt_box : HurtBox
@export var resource_meters : Dictionary[RESOURCE_TYPE,Meter]
@export var weapon_controller: WeaponController
@export var spell_caster: SpellCaster
@export var projectile_launcher: ProjectileLauncher
@export var animation_tree: AnimationTree

#Effect Stuff
@export var modifiers : Array[Modifier]
@export var auras : Array[Aura]

@export var is_friendly : bool
