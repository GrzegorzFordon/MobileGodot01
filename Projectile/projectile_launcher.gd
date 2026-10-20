class_name ProjectileLauncher
extends Node

const PROJECTILE = preload("uid://bw1wne73cs4i3") as PackedScene

func launch_projectile(dir:Vector3,data:ProjectileData):
	if not dir: return
	var projectile = PROJECTILE.instantiate() as Projectile
	projectile.direction = dir
	projectile.data = data
	projectile.source = owner as Entity
	var global_pos = (owner as Entity).global_position
	add_child(projectile)
	projectile.global_position = global_pos + dir
