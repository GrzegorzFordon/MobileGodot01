class_name LaunchProjectileEffect
extends AbilityEffect

enum DIR_CHOICE {AIM,LOOK}
@export var dir_choice : DIR_CHOICE
@export var data : ProjectileData

func apply(ctx:AbilityContext):
	var launcher = ctx.source.projectile_launcher
	if not launcher: return
	var dir = Vector3.ZERO
	match dir_choice:
		DIR_CHOICE.AIM: dir = Vector3(ctx.source.spell_caster.aim_direction.x,0,ctx.source.spell_caster.aim_direction.y)
		DIR_CHOICE.LOOK: dir = ctx.source.global_basis.z
	launcher.launch_projectile(dir,data)

func undo(ctx:AbilityContext):
	pass
