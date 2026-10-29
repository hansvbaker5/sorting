extends Node2D

var starting_values : Array[int] = [1, 2, 3, 4, 5, 6, 7, 8]
var sorted_values : Array[int]

func _ready() -> void:
	sorted_values.append_array(starting_values)
	update_text()

func update_text():
	$RichTextLabel.text = ""
	
	for value in sorted_values:
		$RichTextLabel.text += str(value) + " "

func bubble_sort():
	var temp_values : Array[int]
	temp_values.append_array(starting_values)
	var size : int = temp_values.size()
	
	for i in range(size - 1):
		for j in range(size - i - 1):
			if temp_values[j] > temp_values[j + 1]:
				var temp_value : int = temp_values[j]
				temp_values[j] = temp_values[j + 1]
				temp_values[j + 1] = temp_value
	
	sorted_values.clear()
	sorted_values.append_array(temp_values)
	update_text()

func _on_sort_button_pressed() -> void:
	bubble_sort()

func _on_randomize_button_pressed() -> void:
	starting_values.shuffle()
	sorted_values.clear()
	sorted_values.append_array(starting_values)
	update_text()
