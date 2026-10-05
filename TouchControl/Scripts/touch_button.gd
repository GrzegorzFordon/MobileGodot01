class_name TouchButton
extends TextureButton

@export var input_action_name:=""

func _on_button_down() -> void:
	Input.action_press(input_action_name)

func _on_button_up() -> void:
	Input.action_release(input_action_name)
