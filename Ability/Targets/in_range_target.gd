class_name InRangeTarget
extends AbilityTarget

@export var range := 10.0
@export var max_amount : int
@export var hit_friendly : bool

func set_targets(ctx:AbilityContext)->AbilityContext:
	var shape = SphereShape3D.new()
	shape.radius = range
	var targets : Array[Entity]
	var cast = ShapeCast3D.new()
	ctx.source.add_child(cast)
	cast.exclude_parent = false
	cast.shape = shape
	cast.position = Vector3.ZERO
	cast.target_position = Vector3.ZERO
	cast.force_shapecast_update()
	for i in cast.get_collision_count():
		var cur_col = cast.get_collider(i)
		if cur_col is Entity:
			targets.append(cast.get_collider(i))
	ctx.target = targets
	cast.queue_free()
	if not hit_friendly: filter_targets(ctx)
	if max_amount: filter_nearest(ctx)
	return ctx

func filter_nearest(ctx:AbilityContext):
	ctx.target.sort_custom(sort_distance.bind(ctx))
	ctx.target = ctx.target.slice(0,max_amount)
	
func sort_distance(a:Entity,b:Entity,ctx:AbilityContext):
	var dist_a = ctx.source.global_position.distance_squared_to(a.global_position)
	var dist_b = ctx.source.global_position.distance_squared_to(b.global_position)
	return dist_a < dist_b
