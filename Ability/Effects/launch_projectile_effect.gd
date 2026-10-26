class_name LaunchProjectileEffect
extends AbilityEffect

enum DIR_CHOICE {AIM,LOOK,CTX}

@export var dir_choice : DIR_CHOICE
@export var launch_data : ProjectileLaunchData
@export var projectile_data : ProjectileData
@export var normalize_inputs : bool

func apply(ctx:AbilityContext):
	var launcher = ctx.source.projectile_launcher
	if not launcher: return
	var dir = Vector3.ZERO
	match dir_choice:
		DIR_CHOICE.AIM: dir = Vector3(ctx.source.spell_caster.aim_direction.x,0,ctx.source.spell_caster.aim_direction.y)
		DIR_CHOICE.LOOK: dir = ctx.source.global_basis.z
		DIR_CHOICE.CTX: dir = ctx.context.get("PROJECTILE_DIR",Vector3.ZERO)
	if normalize_inputs: dir = dir.normalized()
	launch_data.launch(launcher,ctx.source,dir,projectile_data)

func undo(ctx:AbilityContext):
	pass
