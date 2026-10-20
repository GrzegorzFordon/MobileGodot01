class_name HurtBox
extends Area3D

signal hit_received(hit_data:HitData)

func on_hit(hit_data:HitData):
	hit_received.emit(hit_data)
