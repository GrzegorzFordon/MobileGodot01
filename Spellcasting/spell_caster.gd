class_name SpellCaster
extends Node

#NOTE - needs to know about joystick inputs - get through input manager?
#Actually also shouldn't know about inputs at all, TODO - move to player

signal spell_equipped(spell:Spell,spell_slot:int)
signal cooldown_set(cooldown:float,spell_slot:int)

@export var spells : Array[Spell]
@export var global_cooldown = 0.1

var entity : Entity
var cooldowns : Array[float]
var is_casting : bool

var aim_direction : Vector2

func _ready() -> void:
	entity = owner
	cooldowns.resize(4)
	cooldowns.fill(0.0)
	for i in spells.size():
		var spell = spells[i]
		equip_spell(spell,i)

func _process(delta: float) -> void:
	reduce_cooldowns(delta)
	update_aim_direction()

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
	if is_casting: return
	is_casting = true
	var spell = spells[spell_slot]
	if not spell: return
	var ctx = AbilityContext.new().with_data(entity)
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
	spell.finish()

func equip_spell(spell:Spell, spell_slot:int):
	#var old_spell = spells[spell_slot]
	#if old_spell and cooldowns.has(old_spell): cooldowns.erase(old_spell)
	spells[spell_slot] = spell
	set_cooldown(spell_slot)
	spell_equipped.emit(spell,spell_slot)

func set_cooldown(spell_slot:int):
	var spell = spells[spell_slot]
	cooldowns[spell_slot] = spell.cooldown
	cooldown_set.emit(spell.cooldown,spell_slot)

func reduce_cooldowns(delta):
	for i in cooldowns.size():
			cooldowns[i] -= delta
			cooldowns[i] = max(cooldowns[i],0.0)

func is_off_cooldown(spell_slot:int):
	return cooldowns[spell_slot] == 0.0

func update_aim_direction():
	aim_direction = Input.get_vector("ABILITY_LEFT","ABILITY_RIGHT","ABILITY_UP","ABILITY_DOWN")
