class_name ScreenHud
extends Control

@export var player : Entity
@export var resource_bars : Dictionary[Entity.RESOURCE_TYPE,TextureProgressBar]

func _ready() -> void:
	for key in resource_bars.keys():
		if not player.resource_meters.has(key):continue
		player.resource_meters[key].value_changed.connect(on_resource_amount_changed.bind(key))

func _process(delta: float) -> void:
	pass

func on_resource_amount_changed(new_val:float,max_val:float,type:Entity.RESOURCE_TYPE):
	resource_bars[type].max_value = max_val
	resource_bars[type].value = new_val
