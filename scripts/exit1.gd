extends Area2D

func _on_Porta_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	$"Sound Select".play()
	yield($"Sound Select", "finished")
	get_tree().change_scene("res://levels/Level_2.tscn")
