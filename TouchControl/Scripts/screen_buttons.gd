@tool
class_name ScreenButtons
extends Control

@export var buttons : Array[TouchButton]

@export var start_angle := 0.0
@export var step := 1.0
@export var distance := 200
@export var button_offset := 64
@export_tool_button("set buttons")
var button = set_button_positions

func set_button_positions():
	for i in buttons.size():
		var btn = buttons[i]
		var angle = deg_to_rad(start_angle + i*step)
		var x_pos = sin(angle)
		var y_pos = cos(angle)
		var pos = Vector2(x_pos,y_pos)
		pos *= distance
		pos -= Vector2.ONE * button_offset
		btn.position = pos
		btn = btn as TouchButton
		btn.texture_rect.texture = btn.debug_texture
	pass

func set_button_spell(spell:Spell,index:int):
	buttons[index].set_spell(spell)

func set_button_cooldown(cooldown:float,index:int):
	buttons[index].set_cooldown(cooldown)
