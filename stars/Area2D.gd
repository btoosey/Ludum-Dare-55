extends Area2D

func _on_input(event):
	if event.is_action_pressed("left_mouse"):
		print("selected")
