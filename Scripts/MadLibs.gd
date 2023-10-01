extends Control

const stories = preload("res://Scripts/Stories.gd")  
onready var InputText = $CenterContainer3/InputText
onready var PlayerText = $CenterContainer2/PlayerText


var player_words = []
var story_i = GlobalVariables.global_story_index
var current_story = stories.STORIES[story_i]

var size_i : int = 0

func _ready():
	if story_i == 8:
		$CenterContainer4/Prompt.text = "Donnez moi un/e..."
	else:
		$CenterContainer4/Prompt.text = "Give me a..."
	InputText.text = current_story.prompts[size_i] + ":"
	PlayerText.grab_focus()
	
func add_to_player_words():
	player_words.append(PlayerText.text)
	InputText.text = ""
	PlayerText.clear()
	PlayerText.grab_focus()
	check_player_words_length()

func _on_PlayerText_text_entered(new_text):
	add_to_player_words()

func _on_NextButton_pressed():
	if is_story_complete():
		end_game()
	else:
		add_to_player_words()
		
func is_story_complete():
	return player_words.size() == current_story.prompts.size()


func check_player_words_length():
	if is_story_complete():
		end_game()
	else:
		prompt_player()
		

func prompt_player():
	size_i += 1
	InputText.text = current_story.prompts[size_i]

func end_game():
	PlayerText.queue_free()
	GlobalVariables.global_stories = player_words
	get_tree().change_scene("res://Scenes/StorybookScene.tscn")

func tell_story():
		InputText.text = current_story.story % player_words

func _on_Button_pressed():
	var js_prompt = current_story.prompts[size_i]
	PlayerText.grab_focus()
	if OS.has_feature('JavaScript') and OS.has_touchscreen_ui_hint():
		find_node("PlayerText").text = JavaScript.eval("""
			window.prompt('""" + js_prompt + """')
		""")
