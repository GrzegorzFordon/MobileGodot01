class_name ProjectileLauncher
extends RefCounted

const PROJECTILE = preload("uid://bw1wne73cs4i3") as PackedScene

func launch_projectile(source:Entity,dir:Vector3,data:ProjectileData):
	if not dir: return
	var projectile = PROJECTILE.instantiate() as Projectile
	projectile.direction = dir
	projectile.data = data
	projectile.source = source
	var global_pos = source.global_position + Vector3.UP
	source.add_child(projectile)
	projectile.global_position = global_pos + dir
