class_name ScreenControls
extends Control

@export var player: Player
@export var screen_buttons: ScreenButtons

func _ready() -> void:
	player.spellcaster.spell_equipped.connect(_on_spell_equipped)

func _on_spell_equipped(spell:SpellData,spell_slot:int):
	screen_buttons.set_button_spell(spell,spell_slot)
