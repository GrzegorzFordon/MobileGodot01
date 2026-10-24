class_name SingleLauncher
extends ProjectileLaunchData

func launch(projectile_launcher:ProjectileLauncher,source:Entity,dir:Vector3,projectile_data:ProjectileData):
	projectile_launcher.launch_projectile(source,dir,projectile_data)
