class_name InputGatherer
extends Node

signal input_updated(data:InputData)

var data := InputData.new()
var prev_data_held_actions:=[]
var inputs :Array[StringName]

func _ready() -> void:
	inputs = InputMap.get_actions() as Array[StringName]
	inputs = inputs.filter(func(val:String):return not val.begins_with("ui"))

func _process(delta: float) -> void:
	data.direction = _get_direction()
	data.just_released_actions = _get_just_released()
	input_updated.emit(data)
	_reset_data()

func _input(event: InputEvent) -> void:
	var relevant_event_id = inputs.find_custom(func(val):return InputMap.event_is_action(event,val))
	var all_relevant_events = InputMap.action_get_events(inputs[relevant_event_id])
	print(all_relevant_events)
	if not all_relevant_events: return
	if event.is_pressed():
		if not data.held_actions.has(inputs[relevant_event_id]):
			data.held_actions.append(inputs[relevant_event_id])
			data.just_pressed_actions.append(inputs[relevant_event_id])
		else:
			data.just_pressed_actions.erase(inputs[relevant_event_id])
	else:
		data.held_actions.erase(inputs[relevant_event_id])

func _get_direction():
	var input_vec2 = Input.get_vector("LEFT","RIGHT","UP","DOWN")
	return input_vec2

func _get_just_released():
	var just_released :Array[String] = []
	for prev_held_input in prev_data_held_actions:
		if not data.held_actions.has(prev_held_input):
			just_released.append(prev_held_input)
	return just_released

func _reset_data():
		prev_data_held_actions = data.held_actions.duplicate()
		data.direction = Vector2.ZERO
		data.direction_alt = Vector2.ZERO
		data.just_pressed_actions.clear()
		data.just_released_actions.clear()
