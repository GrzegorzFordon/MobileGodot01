class_name ConeLauncher
extends ProjectileLaunchData

@export_range(0,360) var arc_deg : int
@export_range(2,10) var amount : int

func use(source,origin,dir,projectile_data):
	var start_angle = -arc_deg / 2
	var angle_step = arc_deg / (amount-1)
	for i in amount:
		var rot_angle = deg_to_rad(start_angle + angle_step * i)
		var rot_dir = dir.rotated(Vector3.UP,rot_angle)
		launch_projectile(source,origin,rot_dir,projectile_data)
