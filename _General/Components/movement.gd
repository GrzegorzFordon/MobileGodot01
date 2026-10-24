class_name Movement
extends Resource

signal footstep_taken()

#@export var character: CharacterBody3D
@export var movement_data : MovementData

#func with_data(_character:CharacterBody3D)->Movement:
	#character = _character

func move(character:CharacterBody3D,delta:float,speed:float,direction:Vector3) -> void:
	if not character: return
	#var delta = get_process_delta_time()

	if direction.length() > 1.0:
		direction = direction.normalized()

	if character.is_on_floor():
		if direction:
			character.velocity.x = move_toward(character.velocity.x, direction.x * speed, movement_data.accel_speed*delta)
			character.velocity.z = move_toward(character.velocity.z, direction.z * speed, movement_data.accel_speed*delta)
		else:
			character.velocity.x = move_toward(character.velocity.x, 0, movement_data.break_speed*delta)
			character.velocity.z = move_toward(character.velocity.z, 0, movement_data.break_speed*delta)
	else:
		character.velocity.x = lerp(character.velocity.x,direction.x*speed,delta*5)
		character.velocity.z = lerp(character.velocity.z,direction.z*speed,delta*5)
	var velocity_without_vertical = Vector3(character.velocity.x,0,character.velocity.z);
	velocity_without_vertical = velocity_without_vertical.limit_length(movement_data.max_speed)
	character.velocity = velocity_without_vertical + Vector3.UP*character.velocity.y 
	character.velocity = character.velocity.limit_length(movement_data.max_speed)
	character.move_and_slide()

func rotate(character:CharacterBody3D,direction:Vector3,delta:float):
	var angle = atan2(direction.x,direction.z)
	character.rotation.y = lerp_angle(character.rotation.y,angle,movement_data.rotation_speed*delta)
