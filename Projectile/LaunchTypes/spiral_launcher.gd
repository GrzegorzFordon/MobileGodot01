class_name SpiralLauncher
extends ProjectileLaunchData

@export var rot_speed : float
@export var is_clockwise : bool
@export_range(1,10) var amount : int
var offset = 0.0

func launch(projectile_launcher:ProjectileLauncher,source:Entity,dir:Vector3,projectile_data:ProjectileData):
	offset += rot_speed * (-1 if is_clockwise else 1)
	var angle_step = 360 / (amount)
	for i in amount:
		var rot_angle = deg_to_rad(offset + angle_step * i)
		var rot_dir = dir.rotated(Vector3.UP,rot_angle)
		projectile_launcher.launch_projectile(source,rot_dir,projectile_data)
