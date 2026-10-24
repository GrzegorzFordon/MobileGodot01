class_name AuraHolder
extends RefCounted

signal list_changed(auras:Array[Aura])

@export var auras : Array[Aura]
var durations : Dictionary[Aura,float]

func add_aura(aura:Aura):
	auras.append(aura)
	aura.on_equip()
	list_changed.emit(auras)
	durations[aura] = aura.duration

func remove_aura(aura:Aura):
	var has_aura = auras.has(aura)
	if not has_aura: return
	auras.erase(aura)
	list_changed.emit(auras)
	durations.erase(aura)

func update_timers(delta):
	for aura in durations.keys():
		durations[aura] -= delta
		if durations[aura] <= 0.0:
			durations.erase(aura)
			aura.on_unequip()
			remove_aura(aura)
