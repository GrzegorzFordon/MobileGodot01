class_name StatRequirement
extends AbilityRequirement

enum COMPARISON {EQUAL,GREATER,SMALLER,GREATER_EQUAL,SMALLER_EQUAL}

@export var stat : Stat.TYPE
@export var comparison : COMPARISON
@export var value : float

var comparison_signs = {
	COMPARISON.EQUAL:"==",
	COMPARISON.GREATER:">",
	COMPARISON.SMALLER:"<",
	COMPARISON.GREATER_EQUAL:">=",
	COMPARISON.SMALLER_EQUAL:"<=",
}

func is_fulfilled(ctx:AbilityContext)->bool:
	var stat_value = ctx.source.stats.get_stat_value(stat)
	var expression = Expression.new()
	var expression_string = str(stat_value,comparison_signs[comparison],value)
	expression.parse(expression_string)
	return expression.execute()
