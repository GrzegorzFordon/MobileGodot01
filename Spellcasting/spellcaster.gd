class_name Spellcaster
extends Node

signal spell_equipped(spell:SpellData,spell_slot:int)

@export var spells : Array[SpellData]
@export var global_cooldown = 0.1

var entity : Entity
var cooldowns : Dictionary[SpellData,float]

func _ready() -> void:
	entity = owner
	for i in spells.size():
		var spell = spells[i]
		equip_spell(spell,i)

func _process(delta: float) -> void:
	reduce_cooldowns(delta)

func _input(event: InputEvent) -> void:
	#TODO - needs aim data (bind)
	if event.is_action_pressed("ACTION_A"): cast_spell(0)
	if event.is_action_pressed("ACTION_B"): cast_spell(1)
	if event.is_action_pressed("ACTION_C"): cast_spell(2)
	if event.is_action_pressed("ACTION_D"): cast_spell(3)
	if event.is_action_released("ACTION_A"): finish_casting_spell(0)
	if event.is_action_released("ACTION_B"): finish_casting_spell(1)
	if event.is_action_released("ACTION_C"): finish_casting_spell(2)
	if event.is_action_released("ACTION_D"): finish_casting_spell(3)

func cast_spell(spell_slot:int, aim_direction:Vector2 = Vector2.ZERO):
	var spell = spells[spell_slot]
	if not spell: return
	var ctx = get_context(aim_direction)
	var can_cast = spell.can_cast(ctx)
	var can_pay = spell.can_pay(ctx)
	if can_cast and can_pay and is_off_cooldown(spell):
		spell.pay(ctx)
		spell.start(ctx)
		cooldowns[spell] = max(spell.cooldown,global_cooldown)

func finish_casting_spell(spell_slot:int):
	var spell = spells[spell_slot]
	if not spell: return
	spell.finish()

func equip_spell(spell:SpellData, spell_slot:int):
	var old_spell = spells[spell_slot]
	if old_spell and cooldowns.has(old_spell): cooldowns.erase(old_spell)
	spells[spell_slot] = spell
	cooldowns[spell] = spell.cooldown
	spell_equipped.emit(spell,spell_slot)

func get_context(aim_dir : Vector2)->SpellContext:
	var ctx = SpellContext.new().with_data(entity,entity.global_position,-entity.global_basis.z,aim_dir)
	return ctx

func reduce_cooldowns(delta):
	for key in cooldowns.keys():
		cooldowns[key] -= delta
		cooldowns[key] = max(cooldowns[key],0.0)
		#TODO - when hits 0

func is_off_cooldown(spell:SpellData):
	return cooldowns[spell] == 0.0
