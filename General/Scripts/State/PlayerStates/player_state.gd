class_name PlayerState
extends State

@export var enable_head_bob := false
@export var can_interact:=false
var player:Player
var current_look_dir:=Vector2.ZERO
var time_since_enter:=0.0
var cached_vel_y

const STATE_STRINGS = {
	"IDLE":"PlayerStateIdle",
	"RUN":"PlayerStateRun",
	"CROUCH":"PlayerStateCrouch",
	"JUMP":"PlayerStateJumping",
	"INAIR":"PlayerStateInAir",
	"GRAPPLING":"PlayerStateGrappling",
	"AIRSLAM":"PlayerStateAirSlam",
	"HITREACT":"PlayerStateHitReact",
	"WALLRUN":"PlayerStateWallRun",
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
	cached_vel_y = player.velocity.y
	#player.movement.check_coyote_time()
	time_since_enter += delta
	super(delta)
	
func physics_tick(delta)->void:
	super(delta)
	pass
	
func process_inputs(input_data:InputData)->void:
	_check_transitions(input_data)

func _check_transitions(input_data:InputData)->void:
	pass

func _move_player(move_type:Movement.MOVE_TYPE):
	var last_input_direction = player.last_input_data.direction
	var direction := player.transform.basis * Vector3(last_input_direction.x, 0, last_input_direction.y).normalized()
	player.movement.move(direction,move_type)
	player.movement.handle_gravity()
