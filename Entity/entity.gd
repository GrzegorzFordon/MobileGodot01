class_name Entity
extends CharacterBody3D

enum RESOURCE_TYPE {HEALTH,MANA,ENERGY,RANGE}

@export var state_machine: StateMachine
@export var movement: Movement
@export var hurt_box : HurtBox
@export var resource_meters : Dictionary[RESOURCE_TYPE,Meter]
@export var weapon_controller: WeaponController
@export var spell_caster: SpellCaster
@export var stats : Stats
@export var animation_tree: AnimationTree
@export var is_friendly : bool

var auras = AuraHolder.new()
var modifiers = ModifierHolder.new()
var projectile_launcher = ProjectileLauncher.new()

func _ready() -> void:
	if state_machine: state_machine.init(self)
	if spell_caster: spell_caster.init(self)
	for meter in resource_meters.values(): meter.reset()
	if stats: stats.init()

func _process(delta: float) -> void:
	if spell_caster: spell_caster.reduce_cooldowns(delta)
	if resource_meters.has(RESOURCE_TYPE.MANA): resource_meters[RESOURCE_TYPE.MANA].refill(delta)
