class_name PlayerStateUsingWeapon
extends PlayerState

func enter()->void:
	actor.weapon_controller.use_weapon()
	animation_data = actor.weapon_controller.get_weapon(WeaponController.TYPE.ACTIVE).visuals.animation_data
	super()

func exit()->void:
	actor.weapon_controller.cancel_use_weapon()
	super()

func physics_tick(delta)->void:
	_move_player(cached_input_data)

func process_inputs(input_data:InputData)->void:
	if input_data.just_released_actions.has("USE_WEAPON"):
		actor.weapon_controller.cancel_use_weapon()
	super(input_data)

func _check_transitions(input_data:InputData)->void:
	#if input_data.just_released_actions.has("USE_WEAPON"):
	if not actor.weapon_controller.is_attacking:
		transition.emit(STATE_STRINGS.IDLE)
