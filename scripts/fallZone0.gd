extends Area2D

func _on_fallZone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://levels/Level_1.tscn")
