class_name Player
extends CharacterBody3D

@export var state_machine: StateMachine
@export var movement: Movement
@export var input_gatherer: InputGatherer

func _ready() -> void:
	input_gatherer.input_updated.connect(_on_inputs_received)

func _physics_process(delta: float) -> void:
	state_machine.physics_tick(delta)

func _on_inputs_received(data:InputData):
	state_machine.process_inputs(data)
	#var direction := transform.basis * Vector3(data.direction.x, 0, data.direction.y).normalized()
	#step_handler.handle_step_climbing(direction)
