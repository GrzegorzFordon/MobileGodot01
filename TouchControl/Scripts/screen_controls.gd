class_name ScreenControls
extends Control

@export var player: Player
@export var screen_buttons: ScreenButtons

func _ready() -> void:
	player.spell_caster.spell_equipped.connect(_on_spell_equipped)
	player.spell_caster.cooldown_set.connect(_on_cooldown_set)

func _on_spell_equipped(spell:Spell,spell_slot:int):
	screen_buttons.set_button_spell(spell,spell_slot)

func _on_cooldown_set(cooldown:float,spell_slot:int):
	screen_buttons.set_button_cooldown(cooldown,spell_slot)
