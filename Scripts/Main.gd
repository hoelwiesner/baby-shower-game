extends Node2D

const parts = preload("res://Scripts/PartsDatabase.gd") 

var hair_i : int = 0
var eyes_i : int = 0
var nose_i : int = 0
var mouth_i : int = 0
var outfit_i : int = 0

var rng = RandomNumberGenerator.new()

func _ready():
	pass

func _on_HairButton_pressed():
	hair_i = (hair_i + 1) % parts.HAIR_LIST.size()
	$Hair.texture = load(parts.HAIR_LIST[hair_i][1])
	$VBoxContainer/HairButton.text = str(parts.HAIR_LIST[hair_i][0])

func _on_EyesButton_pressed():
	eyes_i = (eyes_i + 1) % parts.EYES_LIST.size()
	$Eyes.texture = load(parts.EYES_LIST[eyes_i][1])
	$VBoxContainer/EyesButton.text = str(parts.EYES_LIST[eyes_i][0])

func _on_NoseButton_pressed():
	nose_i = (nose_i + 1) % parts.NOSE_LIST.size()
	$Nose.texture = load(parts.NOSE_LIST[nose_i][1])
	$VBoxContainer/NoseButton.text = str(parts.NOSE_LIST[nose_i][0])

func _on_MouthButton_pressed():
	mouth_i = (mouth_i + 1) % parts.MOUTH_LIST.size()
	$Mouth.texture = load(parts.MOUTH_LIST[mouth_i][1])
	$VBoxContainer/MouthButton.text = str(parts.MOUTH_LIST[mouth_i][0])
	
func _on_OutfitButton_pressed():
	outfit_i = (outfit_i + 1) % parts.OUTFIT_LIST.size()
	$Outfit.texture = load(parts.OUTFIT_LIST[outfit_i][1])
	$VBoxContainer/OutfitButton.text = str(parts.OUTFIT_LIST[outfit_i][0])

func _on_Randomizer_pressed():
	hair_i = rng.randi_range(0, parts.HAIR_LIST.size()-1)
	$Hair.texture = load(parts.HAIR_LIST[hair_i][1])
	$VBoxContainer/HairButton.text = str(parts.HAIR_LIST[hair_i][0])

	eyes_i = rng.randi_range(0, parts.EYES_LIST.size()-1)
	$Eyes.texture = load(parts.EYES_LIST[eyes_i][1])
	$VBoxContainer/EyesButton.text = str(parts.EYES_LIST[eyes_i][0])

	nose_i = rng.randi_range(0, parts.NOSE_LIST.size()-1)
	$Nose.texture = load(parts.NOSE_LIST[nose_i][1])
	$VBoxContainer/NoseButton.text = str(parts.NOSE_LIST[nose_i][0])

	mouth_i = rng.randi_range(0, parts.MOUTH_LIST.size()-1)
	$Mouth.texture = load(parts.MOUTH_LIST[mouth_i][1])
	$VBoxContainer/MouthButton.text = str(parts.MOUTH_LIST[mouth_i][0])

	outfit_i = rng.randi_range(0, parts.OUTFIT_LIST.size()-1)
	$Outfit.texture = load(parts.OUTFIT_LIST[outfit_i][1])
	$VBoxContainer/OutfitButton.text = str(parts.OUTFIT_LIST[outfit_i][0])

func _on_SaveButton_pressed():
	var image = get_viewport().get_texture().get_data()
	image.flip_y()
	var buf = image.save_png_to_buffer()
	JavaScript.download_buffer(buf, "wiesner-baby.png")
