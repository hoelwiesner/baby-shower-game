extends Control

const stories = preload("res://Scripts/Stories.gd")  
const parts = preload("res://Scripts/PartsDatabase.gd") 
var story_i = GlobalVariables.global_story_index
var current_story = stories.STORIES[story_i]
var player_words = GlobalVariables.global_stories

onready var save_button = $Control/CenterContainer/SaveButton


func _ready():
	tell_story()
	generate_baby()
	set_page_background()
	
func tell_story():
		$StoryText.text = current_story.story % player_words
		if story_i == 1:
			$PageEven.text = ""
		else:
			$PageEven.text = str(story_i * 2 -2)
		$PageOdd.text = str(story_i * 2 - 1)

func generate_baby():
	$Baby/Hair.texture = load(parts.HAIR_LIST[GlobalVariables.global_hair_i][1])
	$Baby/Eyes.texture = load(parts.EYES_LIST[GlobalVariables.global_eyes_i][1])
	$Baby/Nose.texture = load(parts.NOSE_LIST[GlobalVariables.global_nose_i][1])
	$Baby/Mouth.texture = load(parts.MOUTH_LIST[GlobalVariables.global_mouth_i][1])
	$Baby/Outfit.texture = load(parts.OUTFIT_LIST[GlobalVariables.global_outfit_i][1])

func set_page_background():
	$StoryBookBlank.texture = load(current_story.image)
	
func _on_Button_pressed():
	var image = get_viewport().get_texture().get_data()
	image.flip_y()
	var buf = image.save_png_to_buffer()
	JavaScript.download_buffer(buf, "wiesner-baby.png")

