extends HBoxContainer

var isDone: bool = false

func _on_delete_pressed():
	queue_free()

func _on_complete_pressed():
	if isDone == true:
		isDone = false
		$Label.modulate = Color(1,1,1,1)
	else:
		isDone = true
		$Label.modulate = Color(1,1,1,0.2)
