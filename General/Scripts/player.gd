class_name Player
extends Entity

@export var state_machine: StateMachine
@export var input_gatherer: InputGatherer
@export var animation_tree: AnimationTree

func _ready() -> void:
	input_gatherer.input_updated.connect(_on_inputs_received)

func _physics_process(delta: float) -> void:
	state_machine.physics_tick(delta)
	update_animation()

func _on_inputs_received(data:InputData):
	state_machine.process_inputs(data)
	#var direction := transform.basis * Vector3(data.direction.x, 0, data.direction.y).normalized()
	#step_handler.handle_step_climbing(direction)

func update_animation():
	var dir = velocity.normalized()
	var result = Vector2(dir.x,dir.z).rotated(rotation.y)
	var lerp_result = lerp(animation_tree.get("parameters/MoveBlendSpace/blend_position"),result,20.0*get_process_delta_time())
	animation_tree.set("parameters/MoveBlendSpace/blend_position",lerp_result)
