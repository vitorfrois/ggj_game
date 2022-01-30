extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Quit.grab_focus()
	$"Music Credits".play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Quit_pressed():
	$"Sound Select".play()
	yield($"Sound Select", "finished")
	get_tree().change_scene("res://levels/Menu.tscn")
