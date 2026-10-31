class_name AninmationTreeController
extends AnimationTree

const BLEND_FULL = "full_blend_animation"
const BLEND_FILTERED = "filtered_blend_animation"
const ONESHOT_FULL = "full_one_shot_animation"
const ONESHOT_FILTERED = "filtered_one_shot_animation"
const BLEND_FULL_PATH = "parameters/full_blend/blend_amount"
const BLEND_FILTERED_PATH = "parameters/filtered_blend/blend_amount"
const ONESHOT_FULL_PATH = "parameters/full_one_shot/request"
const ONESHOT_FILTERED_PATH = "parameters/filtered_one_shot/request"


func play(data:AnimationData):
	if data.animation_name=="":return
	if data.is_oneshot:
		var node_name = ONESHOT_FILTERED if data.is_filtered else ONESHOT_FULL
		var node_path = ONESHOT_FILTERED_PATH if data.is_filtered else ONESHOT_FULL_PATH
		tree_root.get_node(node_name).animation = data.animation_name
		set(node_path,AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
	else:
		var node_name = BLEND_FILTERED if data.is_filtered else BLEND_FULL
		var node_path = BLEND_FILTERED_PATH if data.is_filtered else BLEND_FULL_PATH
		tree_root.get_node(node_name).animation = data.animation_name
		set(node_path,1)

func stop():
	set(BLEND_FILTERED_PATH,0)
	set(BLEND_FULL_PATH,0)
	set("parameters/BlendFilteredTimeSeek/seek_request",0.0)
	set("parameters/BlendFullTimeSeek/seek_request",0.0)
	set(ONESHOT_FILTERED_PATH,AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
	set(ONESHOT_FULL_PATH,AnimationNodeOneShot.ONE_SHOT_REQUEST_ABORT)
