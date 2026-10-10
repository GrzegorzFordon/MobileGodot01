class_name TouchButton
extends TextureButton

@export var input_action_name:=""
@export var debug_texture : Texture2D
@export var texture_rect: TextureRect

func _ready() -> void:
	texture_rect.texture = debug_texture

func _on_button_down() -> void:
	Input.action_press(input_action_name)

func _on_button_up() -> void:
	Input.action_release(input_action_name)
