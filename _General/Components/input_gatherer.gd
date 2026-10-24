class_name InputGatherer
extends Node

signal input_updated(data:InputData)

var inputs :Array[StringName]
var data := InputData.new()
var prev_data_held_actions:=[]

func _ready() -> void:
	inputs = InputMap.get_actions() as Array[StringName]
	inputs = inputs.filter(func(val:String):return not val.begins_with("ui"))

func _process(delta: float) -> void:
	data.direction = _get_direction()[0]
	data.look_direction = _get_direction()[1]
	data.aim_direction = _get_direction()[2]
	data.just_released_actions = _get_just_released()
	input_updated.emit(data)
	_reset_data()

func _input(event: InputEvent) -> void:
	var relevant_event_id = inputs.find_custom(func(val):return InputMap.event_is_action(event,val))
	if relevant_event_id == -1: return
	var relevant_input_name = inputs[relevant_event_id]
	if event.is_pressed():
		if not data.held_actions.has(relevant_input_name):
			data.held_actions.append(relevant_input_name)
			data.just_pressed_actions.append(relevant_input_name)
		else:
			data.just_pressed_actions.erase(relevant_input_name)
	else:
		data.held_actions.erase(relevant_input_name)

func _get_direction():
	var input_vec2_move = Input.get_vector("MOVE_LEFT","MOVE_RIGHT","MOVE_UP","MOVE_DOWN")
	var input_vec2_look = Input.get_vector("LOOK_LEFT","LOOK_RIGHT","LOOK_UP","LOOK_DOWN")
	var input_vec2_aim = Input.get_vector("ABILITY_LEFT","ABILITY_RIGHT","ABILITY_UP","ABILITY_DOWN")
	return [input_vec2_move,input_vec2_look,input_vec2_aim]

func _get_just_released():
	var just_released :Array[String] = []
	for prev_held_input in prev_data_held_actions:
		if not data.held_actions.has(prev_held_input):
			just_released.append(prev_held_input)
	return just_released

func _reset_data():
		prev_data_held_actions = data.held_actions.duplicate()
		data.direction = Vector2.ZERO
		data.look_direction = Vector2.ZERO
		data.just_pressed_actions.clear()
		data.just_released_actions.clear()
