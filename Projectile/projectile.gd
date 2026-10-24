class_name Projectile
extends Node3D

@export var data : ProjectileData

var source : Entity
var direction : Vector3
var timer : SceneTreeTimer

func _ready() -> void:
	timer = get_tree().create_timer(data.duration)
	timer.timeout.connect(clean_up)

func _process(delta: float) -> void:
	move(delta)

func move(delta:float):
	if direction:
		global_position += direction * data.speed * delta

func clean_up():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector3.ZERO,0.2).set_trans(Tween.TRANS_CUBIC)
	tween.finished.connect(func(): call_deferred("queue_free"))
	tween.play()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Entity and not body == source:
		var ctx = AbilityContext.new().with_data(source,[body])
		for effect in data.on_hit_effects:
			effect.resolve(ctx)
		clean_up()
