@abstract
class_name PlayerState
extends State

@export var animation_data:AnimationData
#var player:Player
var time_since_enter:=0.0
var cached_vel_y

var cached_input_data := InputData.new()

const STATE_STRINGS = {
	"IDLE":"PlayerStateIdle",
	"RUN":"PlayerStateRun",
	"USEWEAPON":"PlayerStateUsingWeapon",
	"SPELLCAST":"PlayerStateSpellCasting",
	}

func enter()->void:
	time_since_enter = 0.0
	print("entering: ",self.get_script().get_global_name())
	if animation_data:
		actor.animation_tree_controller.play(animation_data)

func exit()->void:
	actor.animation_tree_controller.stop()
	pass

func tick(delta)->void:
	time_since_enter += delta
	
func physics_tick(delta)->void:
	time_since_enter += delta
	
func process_inputs(input_data:InputData)->void:
	cache_inputs(input_data)
	actor.spell_caster.aim_direction = input_data.aim_direction
	_check_transitions(input_data)

func _check_transitions(input_data:InputData)->void:
	pass

func _move_player(input_data:InputData):
	var direction := Vector3(input_data.direction.x, 0, input_data.direction.y).normalized()
	var direction_look := Vector3(input_data.look_direction.x, 0, input_data.look_direction.y).normalized()
	actor.movement.move(actor,1.0/60,5,direction)
	if direction_look: actor.movement.rotate(actor,direction_look,1.0/60)
	elif direction: actor.movement.rotate(actor,direction,1.0/60)

func cache_inputs(input_data:InputData):
	cached_input_data.direction = input_data.direction
	cached_input_data.look_direction = input_data.look_direction
	cached_input_data.aim_direction = input_data.aim_direction
	cached_input_data.held_actions = cached_input_data.held_actions
