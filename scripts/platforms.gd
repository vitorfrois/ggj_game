extends Node2D

var mode = get_parent().get_node("alma").mode

func _toggle_plat_collision():
	if mode == "luz":
		$sombra_platforms.disabled = true
