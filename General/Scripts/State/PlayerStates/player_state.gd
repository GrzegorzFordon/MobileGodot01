class_name PlayerState
extends State

@export var enable_head_bob := false
@export var can_interact:=false
var player:Player
var current_look_dir:=Vector2.ZERO
var time_since_enter:=0.0
var cached_vel_y

var cached_input_data := InputData.new()

const STATE_STRINGS = {
	"IDLE":"PlayerStateIdle",
	"RUN":"PlayerStateRun",
	#"CROUCH":"PlayerStateCrouch",
	#"JUMP":"PlayerStateJumping",
	#"INAIR":"PlayerStateInAir",
	#"GRAPPLING":"PlayerStateGrappling",
	#"AIRSLAM":"PlayerStateAirSlam",
	#"HITREACT":"PlayerStateHitReact",
	#"WALLRUN":"PlayerStateWallRun",
	}

func _ready() -> void:
	player = owner

func enter(_data=null)->void:
	time_since_enter = 0.0
	print(name)
	super(_data)

func exit()->void:
	super()

func tick(delta)->void:
	#cached_vel_y = player.velocity.y
	#player.movement.check_coyote_time()
	time_since_enter += delta
	super(delta)
	
func physics_tick(delta)->void:
	super(delta)
	pass
	
func process_inputs(input_data:InputData)->void:
	cached_input_data.direction = input_data.direction
	cached_input_data.direction_alt = input_data.direction_alt
	cached_input_data.held_actions = cached_input_data.held_actions
	_check_transitions(input_data)

func _check_transitions(input_data:InputData)->void:
	pass

func _move_player(input_data:InputData,move_type:Movement.MOVE_TYPE):
	var direction := Vector3(input_data.direction.x, 0, input_data.direction.y).normalized()
	var direction_look := Vector3(input_data.direction_alt.x, 0, input_data.direction_alt.y).normalized()
	player.movement.move(direction,move_type)
	if direction_look: player.movement.rotate(direction_look)
	player.movement.handle_gravity()
