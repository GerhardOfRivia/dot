extends Control

@onready var newItemFactory = load("res://NewItem.tscn")

func _ready():
	$Tasks.request_completed.connect(_on_tasks_request_completed)
	$NewTask.request_completed.connect(_on_new_tasks_request_completed)
	$Tasks.request("http://localhost:8000/tasks")

func _on_tasks_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)

func _on_new_tasks_request_completed(result, response_code, headers, body):
	var json = JSON.parse_string(body.get_string_from_utf8())
	print(json)

func _post_new_task(subject, user):
	var payload = {"subject": subject, "user": user}
	var post = HTTPClient.METHOD_POST
	var headers = ["Content-Type: application/json"]
	var json = JSON.stringify(payload)
	$NewTask.request("http://localhost:8000/tasks", headers, post, json)

func create_new_item():
	var newItem = newItemFactory.instantiate()
	newItem.get_node("Label").text = $Contents/HBoxContainer/NewTodoInput.text
	$Contents/HBoxContainer/NewTodoInput.text = ""
	$Contents/ScrollContainer/TodoList.add_child(newItem)

func _on_add_todo_pressed():
	create_new_item()

func _on_new_todo_input_text_submitted(_new_text):
	create_new_item()
