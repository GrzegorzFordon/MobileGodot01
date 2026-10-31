class_name Projectile
extends Node3D

@export var data : ProjectileData

var source : Entity
var direction : Vector3
var timer : SceneTreeTimer

func _ready() -> void:
	scale_up()
	timer = get_tree().create_timer(data.duration)
	timer.timeout.connect(clean_up)

func _process(delta: float) -> void:
	move(delta)

func move(delta:float):
	if direction:
		global_position += direction * data.speed * delta

func scale_up():
	scale = Vector3.ONE*0.001
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector3.ONE,0.2).set_trans(Tween.TRANS_CUBIC)
	tween.play()

func clean_up():
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",Vector3.ONE*0.001,0.2).set_trans(Tween.TRANS_CUBIC)
	tween.finished.connect(func(): call_deferred("queue_free"))
	tween.play()

func _on_area_3d_body_entered(body: Node3D) -> void:
	if body is Entity and not body == source:
		var ctx = AbilityContext.new().with_data(source,global_position,[body])
		for effect in data.on_hit_effects:
			effect.apply(ctx)
		if not data.is_penetrating: clean_up()

func tween_scale(start_scale:Vector3,goal_scale:Vector3):
	scale = start_scale
	var tween = get_tree().create_tween()
	tween.tween_property(self,"scale",goal_scale,0.2).set_trans(Tween.TRANS_CUBIC)
	tween.finished.connect(func(): call_deferred("queue_free"))
	tween.play()
