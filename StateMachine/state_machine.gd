class_name StateMachine
extends Resource

@export var states : Array[State]

var states_dict = {}
var current_state: State

func init(actor):
	for state in states:
		states_dict[state.get_script().get_global_name().to_lower()] = state
		state.transition.connect(transition)
	transition(states[0].get_script().get_global_name().to_lower())
	for state in states_dict.values():
		state.actor = actor

func process_inputs(input_data: InputData) -> void:
	if current_state:
		current_state.process_inputs(input_data)

func tick(delta):
	if current_state:
		current_state.tick(delta)

func physics_tick(delta):
	if current_state:
		current_state.physics_tick(delta)

func transition(new_state_name: String):
	var new_state = states_dict[new_state_name.to_lower()]
	if !new_state:
		return
	if current_state:
		current_state.exit()
	current_state = new_state
	current_state.enter()
