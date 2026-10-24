class_name Enemy
extends Entity

func _process(delta: float) -> void:
	resource_meters[RESOURCE_TYPE.HEALTH].refill(delta)
	super(delta)
