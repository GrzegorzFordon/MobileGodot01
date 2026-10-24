class_name Stats
extends Resource

signal stat_changed(stat_type:Stat.TYPE,new_val:float)

@export var block : StatBlock

var stats : Dictionary[Stat.TYPE,Stat]

func init() -> void:
	if block:
		for stat in block.stats.values():
			add_stat(stat.duplicate())

func get_stat_value(stat_type:Stat.TYPE)->float:
	var stat = stats[stat_type]
	if stat: return stat.value
	return 0.0
	
func add_stat(stat:Stat):
	stats[stat.type] = stat

func add_modifier(modifier:StatModifier,source:Entity):
	var stat = stats[modifier.stat]
	if stat: stat.add_modifier(modifier)

#func remove_stats_from_source(source:Entity):
	#for stat in stats.values():
		#for (modifier as StatModifier) in stat.
	#pass
