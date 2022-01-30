extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()
	$"Music Menu".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Start_pressed():
	$"Sound Select".play()
	yield($"Sound Select", "finished")
	get_tree().change_scene("res://levels/Level_0.tscn")
	

func _on_Credits_pressed():
	$"Sound Select".play()
	yield($"Sound Select", "finished")
	get_tree().change_scene("res://levels/Credits.tscn")

func _on_Quit_pressed():
	$"Sound Select".play()
	yield($"Sound Select", "finished")
	get_tree().quit()
	
