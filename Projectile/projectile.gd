class_name Projectile
extends Node3D

@export var data : ProjectileData
var source : Entity
var direction : Vector3
var timer : SceneTreeTimer

func _ready() -> void:
	timer = get_tree().create_timer(data.duration)
	timer.timeout.connect(queue_free)

func _process(delta: float) -> void:
	move(delta)

func move(delta:float):
	if direction:
		global_position += direction * data.speed * delta

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Entity:
		var ctx = AbilityContext.new().with_data(source,[body])
		for effect in data.on_hit_effects:
			effect.resolve(ctx)
		call_deferred("queue_free")
