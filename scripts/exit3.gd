extends Area2D



func _on_Area2D_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	get_tree().change_scene("res://levels/Credits.tscn")
