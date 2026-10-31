class_name SpellCaster
extends Node

signal spell_equipped(spell:Spell,spell_slot:int)
signal spell_unequipped(spell:Spell,spell_slot:int)
signal cooldown_set(cooldown:float,spell_slot:int)

@export var spell_set : SpellSet
@export var spells : Array[Spell]
@export var global_cooldown = 0.1

var entity : Entity
var cooldowns : Array[float]
var is_casting : bool
var aim_direction : Vector2

func _ready():
	entity = owner
	cooldowns.resize(4)
	cooldowns.fill(0.0)
	spells.resize(4)
	if spell_set:
		for i in spell_set.spells.size():
			var spell = spell_set.spells[i]
			equip_spell(spell,i)

func _process(delta: float) -> void:
	_reduce_cooldowns(delta)

func cast_spell(spell_slot:int):
	if spell_slot >= spells.size(): return
	if is_casting: return
	var spell = spells[spell_slot]
	if not spell: return
	#if spell.is_aimed and not aim_direction: return
	is_casting = true
	var ctx = AbilityContext.new().with_data(entity,entity.global_position)
	var can_cast = spell.can_cast(ctx)
	var can_pay = spell.can_pay(ctx)
	if can_cast and can_pay and is_off_cooldown(spell_slot):
		spell.pay(ctx)
		spell.start(ctx)

func finish_casting_spell(spell_slot:int):
	if not is_casting: return
	is_casting = false
	var spell = spells[spell_slot]
	if not spell: return
	set_cooldown(spell_slot)
	var ctx = AbilityContext.new().with_data(entity,entity.global_position)
	spell.finish(ctx)

func equip_spell(spell:Spell, spell_slot:int):
	spells[spell_slot] = spell
	set_cooldown(spell_slot)
	spell_equipped.emit(spell,spell_slot)

func unequip_spell(spell_slot:int):
	spell_unequipped.emit(spells[spell_slot],spell_slot)
	spells[spell_slot] = null

func set_cooldown(spell_slot:int):
	var spell = spells[spell_slot]
	cooldowns[spell_slot] = spell.cooldown
	cooldown_set.emit(spell.cooldown,spell_slot)

func is_off_cooldown(spell_slot:int):
	return cooldowns[spell_slot] == 0.0

func _reduce_cooldowns(delta):
	for i in cooldowns.size():
			cooldowns[i] -= delta
			cooldowns[i] = max(cooldowns[i],0.0)
