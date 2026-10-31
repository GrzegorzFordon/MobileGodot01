class_name DEBUGEffect
extends AbilityEffect

func apply(ctx:AbilityContext):
	print("apply: ",ctx.to_string())

func undo(ctx:AbilityContext):
	print("undo: ",ctx)
