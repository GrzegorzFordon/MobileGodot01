@tool
class_name StepManager
extends Node3D

@export var player: Player
@export var torus_mesh_instance: MeshInstance3D

@export var marker_left_foot_ik: Marker3D
@export var marker_right_foot_ik: Marker3D
@export var marker_left_foot_step: Marker3D
@export var marker_right_foot_step: Marker3D
@export var raycast_left_foot: RayCast3D
@export var raycast_right_foot: RayCast3D

@export var step_distance := 0.5
@export var step_duration := 0.02
@export var offset:=0.5

var left_tween:Tween
var right_tween:Tween

var left_running:=false
var right_running:=false

var left_is_active := true

@onready var prev_global_position = player.global_position

func _process(delta: float) -> void:
	_set_step_markers()
	_check_offsets()
	_set_pos()

func _set_step_markers():
	if raycast_left_foot.get_collider():
		var pos = raycast_left_foot.get_collision_point()
		marker_left_foot_step.global_position = pos
	if raycast_right_foot.get_collider():
		var pos = raycast_right_foot.get_collision_point()
		marker_right_foot_step.global_position = pos

func _check_offsets():
	var dist_left = abs(marker_left_foot_ik.global_position-marker_left_foot_step.global_position).length()
	var dist_right = abs(marker_right_foot_ik.global_position-marker_right_foot_step.global_position).length()
	if dist_left > step_distance and left_is_active:
		if not (left_running or right_running):
			left_running = true
			left_tween = get_tree().create_tween()
			left_tween.tween_property(marker_left_foot_ik,"global_position",marker_left_foot_step.global_position,step_duration)
			left_tween.finished.connect(func():left_running=false)
			left_tween.finished.connect(func():left_is_active = not left_is_active)
	elif dist_right > step_distance:
		if not (left_running or right_running):
			right_running = true
			right_tween = get_tree().create_tween()
			right_tween.tween_property(marker_right_foot_ik,"global_position",marker_right_foot_step.global_position,step_duration)
			right_tween.finished.connect(func():right_running=false)
			right_tween.finished.connect(func():left_is_active = not left_is_active)

func _set_pos():
	var velocity = (player.global_position-prev_global_position).normalized()
	velocity.y = 0
	global_position = lerp(global_position,player.global_position+velocity * offset,50*get_process_delta_time())
	prev_global_position = player.global_position
