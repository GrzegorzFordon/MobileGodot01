@abstract
class_name PlayerState
extends State

@export var animation_name:String
@export var animation_is_one_shot:bool
@export var animation_is_top_only:bool

#var player:Player
var time_since_enter:=0.0
var cached_vel_y

var cached_input_data := InputData.new()

const STATE_STRINGS = {
	"IDLE":"PlayerStateIdle",
	"RUN":"PlayerStateRun",
	}

func enter()->void:
	time_since_enter = 0.0
	print("entering: ",self.get_script().get_global_name())
	#player.animation_tree.set_animation(animation_name,animation_is_top_only,animation_is_one_shot)

#func exit()->void:
	#player.animation_tree.reset_animations()

func tick(delta)->void:
	time_since_enter += delta

func process_inputs(input_data:InputData)->void:
	cached_input_data.direction = input_data.direction
	cached_input_data.look_direction = input_data.look_direction
	cached_input_data.aim_direction = input_data.aim_direction
	cached_input_data.held_actions = cached_input_data.held_actions
	var action_dict = {"A":0,"B":1,"C":2,"D":3}
	for key in action_dict.keys():
		if input_data.just_pressed_actions.has("ACTION_"+key):actor.spell_caster.cast_spell(action_dict[key])
		if input_data.just_released_actions.has("ACTION_"+key):actor.spell_caster.finish_casting_spell(action_dict[key])
	actor.spell_caster.aim_direction = input_data.aim_direction
	_check_transitions(input_data)

func _check_transitions(input_data:InputData)->void:
	pass

func _move_player(input_data:InputData):
	var direction := Vector3(input_data.direction.x, 0, input_data.direction.y).normalized()
	var direction_look := Vector3(input_data.look_direction.x, 0, input_data.look_direction.y).normalized()
	actor.movement.move(actor,1.0/60,5,direction)
	#if direction_look: actor.movement.rotate(actor,direction_look,1.0/60)
	if direction: actor.movement.rotate(actor,direction,1.0/60)
