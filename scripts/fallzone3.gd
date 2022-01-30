extends Area2D

func _on_fallzone_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	print("colisão 3")
	get_tree().reload_current_scene()
