@abstract
class_name ProjectileLaunchData
extends Resource

const PROJECTILE = preload("uid://bw1wne73cs4i3") as PackedScene

@abstract func use(source:Entity,origin:Vector3,dir:Vector3,projectile_data:ProjectileData)

func launch_projectile(source:Entity,origin:Vector3,dir:Vector3,data:ProjectileData):
	#if not dir: return
	var projectile = PROJECTILE.instantiate() as Projectile
	projectile.direction = dir
	projectile.data = data
	projectile.source = source
	var global_pos = origin + Vector3.UP
	source.add_child(projectile)
	projectile.global_position = global_pos + dir*0.1
