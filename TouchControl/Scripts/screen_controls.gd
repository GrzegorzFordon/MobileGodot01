class_name ScreenControls
extends Control

@export var player: Player
@export var screen_buttons: ScreenButtons

var weapon_pressed_event = InputEventAction.new()


func _ready() -> void:
	player.spell_caster.spell_equipped.connect(_on_spell_equipped)
	player.spell_caster.cooldown_set.connect(_on_cooldown_set)
	weapon_pressed_event.action = "USE_WEAPON"

func _on_spell_equipped(spell:Spell,spell_slot:int):
	screen_buttons.set_button_spell(spell,spell_slot)

func _on_cooldown_set(cooldown:float,spell_slot:int):
	screen_buttons.set_button_cooldown(cooldown,spell_slot)

func _on_attack_pressed():
	weapon_pressed_event.pressed = true
	Input.parse_input_event(weapon_pressed_event)

func _on_attack_released(last_input:Vector2):
	weapon_pressed_event.pressed = false
	Input.parse_input_event(weapon_pressed_event)
