extends Control

@onready var newItemFactory = load("res://NewItem.tscn")

func create_new_item():
	var newItem = newItemFactory.instantiate()
	newItem.get_node("Label").text = $Contents/HBoxContainer/NewTodoInput.text
	$Contents/HBoxContainer/NewTodoInput.text = ""
	$Contents/ScrollContainer/TodoList.add_child(newItem)

func _on_add_todo_pressed():
	create_new_item()

func _on_new_todo_input_text_submitted(_new_text):
	create_new_item()
