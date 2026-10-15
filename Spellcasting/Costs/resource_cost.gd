class_name ResourceCost
extends SpellCost

enum RESOURCE_TYPE {MANA,HEALTH,ENERGY,RAGE} #TODO - where does this go


func can_pay(ctx:SpellContext)->bool:
	return true

func pay(ctx:SpellContext):
	pass
