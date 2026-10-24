class_name StatRequirement
extends AbilityRequirement

enum COMPARISON {EQUAL,GREATER,SMALLER,GREATEREQUAL,SMALLEREQUAL}

@export var stat : Stat.TYPE
@export var comparison : COMPARISON
@export var value : int

var comparison_signs = {
	COMPARISON.EQUAL:"=",
	COMPARISON.GREATER:">",
	COMPARISON.SMALLER:"<",
	COMPARISON.GREATEREQUAL:">=",
	COMPARISON.SMALLEREQUAL:"<=",
}

func is_fulfilled(ctx:AbilityContext)->bool:
	var stat_value = ctx.source.stats.get_stat_value(stat)
	var expression = Expression.new()
	var expression_string = str(stat_value,comparison_signs[comparison],value)
	expression.parse(expression_string)
	return expression.execute()
