extends Control


const stories = preload("res://Scripts/Stories.gd")  
var story_count = stories.STORIES.size() + 1

onready var story_label = $StorySelect/StoryLabel
var rng

var current_selected = 0

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()

func _on_NextScene_pressed():
	if current_selected == 0:
		GlobalVariables.global_story_index = rng.randi_range(1, story_count - 2)
	else:
		GlobalVariables.global_story_index = current_selected
	get_tree().change_scene("res://Scenes/MadLibs.tscn")

func change_story_label():
	if current_selected == 0:
		story_label.text = "Give me a random story!"
	else:
		story_label.text = "Story " + str(current_selected)

func _on_StoryMinus_pressed():
	if current_selected == 0:
		current_selected = story_count - 1
	else:
		current_selected -= 1
	change_story_label()

func _on_StoryPlus_pressed():
	current_selected = (current_selected + 1) % story_count
	change_story_label()


