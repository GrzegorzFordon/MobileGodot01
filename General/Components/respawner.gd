class_name Respawner
extends Node

@export var enabled:=false
@export var target:Node3D
@export var respawn_position:Vector3
@export var respawn_y_pos:float
signal respawned()

func _ready() -> void:
	if not target:
		target = get_parent()

func _process(delta: float) -> void:
	if not target or not enabled:return
	if target.global_position.y < -respawn_y_pos:
		respawned.emit()
		target.global_position = respawn_position
