class_name HealthBar
extends MeshInstance3D

@export var move_speed : float

var entity : Entity
var goal_val : float

func _ready() -> void:
	if not entity: entity = owner
	entity.resource_meters[Entity.RESOURCE_TYPE.HEALTH].value_changed.connect(on_value_changed)
	set_instance_shader_parameter("health",1.0)

func _process(delta: float) -> void:
	var cur_val = get_instance_shader_parameter("health")
	var lerp_val = move_toward(cur_val,goal_val,move_speed * delta)
	set_instance_shader_parameter("health",lerp_val)

func _exit_tree() -> void:
	entity.resource_meters[Entity.RESOURCE_TYPE.HEALTH].value_changed.disconnect(on_value_changed)

func on_value_changed(new_val:float,max_val:float):
	goal_val = new_val/max_val
	#set_instance_shader_parameter("health",new_val/max_val)
