class_name LaunchProjectileEffect
extends SpellEffect

func execute(ctx:SpellContext):
	var launcher = ctx.source.projectile_launcher
	if not launcher: return
	pass
