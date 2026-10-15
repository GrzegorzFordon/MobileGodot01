class_name TouchButton
extends TextureButton

@export var input_action_name:=""
@export var spell_icon_texture : Texture2D
@export var texture_rect: TextureRect
@export var aim_virtual_joystick: VirtualJoystick
@export var cooldown_progress: TextureProgressBar
@export var cooldown_label: Label

var cooldown_amount = 0.0
var pressed_event = InputEventAction.new()

func _ready() -> void:
	texture_rect.texture = spell_icon_texture
	pressed_event.action = input_action_name

func _process(delta: float) -> void:
	update_cooldown(delta)

func _on_button_down() -> void:
	pressed_event.pressed = true
	Input.parse_input_event(pressed_event)
	#Input.action_press(input_action_name)

func _on_button_up() -> void:
	pressed_event.pressed = false
	Input.parse_input_event(pressed_event)
	#Input.action_release(input_action_name)

func set_spell(spell:SpellData):
	texture_rect.texture = spell.icon
	aim_virtual_joystick.visible = spell.is_aimed
	action_mode = BaseButton.ACTION_MODE_BUTTON_RELEASE if spell.is_aimed else BaseButton.ACTION_MODE_BUTTON_PRESS
	cooldown_progress.max_value = spell.cooldown

func set_cooldown(amount:float):
	cooldown_amount = amount

func update_cooldown(delta:float):
	cooldown_progress.visible = cooldown_amount >= 0.0
	if cooldown_amount: cooldown_amount = max(cooldown_amount-delta,0.0)
	cooldown_progress.value = cooldown_amount
	cooldown_label.text = str(cooldown_amount)
