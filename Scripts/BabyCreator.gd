extends Node2D

const parts = preload("res://Scripts/PartsDatabase.gd") 

onready var hair_label = $MarginContainer/VBoxContainer/HairH/HairLabel
onready var eyes_label = $MarginContainer/VBoxContainer/EyesH/EyesLabel
onready var nose_label = $MarginContainer/VBoxContainer/NoseH/NoseLabel
onready var mouth_label = $MarginContainer/VBoxContainer/MouthH/MouthLabel
onready var outfit_label = $MarginContainer/VBoxContainer/OutfitH/OutfitLabel

var hair_i : int = 0
var eyes_i : int = 0
var nose_i : int = 0
var mouth_i : int = 0
var outfit_i : int = 0

var rng

func _ready():
	rng = RandomNumberGenerator.new()
	rng.randomize()

func hair_reload():
	$Baby/Hair.texture = load(parts.HAIR_LIST[hair_i][1])
	hair_label.text = str(parts.HAIR_LIST[hair_i][0])

func eyes_reload():
	$Baby/Eyes.texture = load(parts.EYES_LIST[eyes_i][1])
	eyes_label.text = str(parts.EYES_LIST[eyes_i][0])

func nose_reload():
	$Baby/Nose.texture = load(parts.NOSE_LIST[nose_i][1])
	nose_label.text = str(parts.NOSE_LIST[nose_i][0])

func mouth_reload():
	$Baby/Mouth.texture = load(parts.MOUTH_LIST[mouth_i][1])
	mouth_label.text = str(parts.MOUTH_LIST[mouth_i][0])	

func outfit_reload():
	$Baby/Outfit.texture = load(parts.OUTFIT_LIST[outfit_i][1])
	outfit_label.text = str(parts.OUTFIT_LIST[outfit_i][0])

	
func _on_Randomizer_pressed():
	hair_i = rng.randi_range(0, parts.HAIR_LIST.size()-1)
	hair_reload()

	eyes_i = rng.randi_range(0, parts.EYES_LIST.size()-1)
	eyes_reload()

	nose_i = rng.randi_range(0, parts.NOSE_LIST.size()-1)
	nose_reload()

	mouth_i = rng.randi_range(0, parts.MOUTH_LIST.size()-1)
	mouth_reload()

	outfit_i = rng.randi_range(0, parts.OUTFIT_LIST.size()-1)
	outfit_reload()


func _on_HairMinus_pressed():
	if hair_i == 0:
		hair_i = parts.HAIR_LIST.size() - 1
	else:
		hair_i -= 1
	hair_reload()

func _on_HairPlus_pressed():
	hair_i = (hair_i + 1) % parts.HAIR_LIST.size()
	hair_reload()

func _on_EyesMinus_pressed():
	if eyes_i == 0:
		eyes_i = parts.EYES_LIST.size() - 1
	else:
		eyes_i -= 1
	eyes_reload()

func _on_EyesPlus_pressed():
	eyes_i = (eyes_i + 1) % parts.EYES_LIST.size()
	eyes_reload()

func _on_NoseMinus_pressed():
	if nose_i == 0:
		nose_i = parts.NOSE_LIST.size() - 1
	else:
		nose_i -= 1
	nose_reload()

func _on_NosePlus_pressed():
	nose_i = (nose_i + 1) % parts.NOSE_LIST.size()
	nose_reload()

func _on_MouthMinus_pressed():
	if mouth_i == 0:
		mouth_i = parts.MOUTH_LIST.size() - 1
	else:
		mouth_i -= 1
	mouth_reload()

func _on_MouthPlus_pressed():
	mouth_i = (mouth_i + 1) % parts.MOUTH_LIST.size()
	mouth_reload()

func _on_OutfitMinus_pressed():
	if outfit_i == 0:
		outfit_i = parts.OUTFIT_LIST.size() - 1
	else:
		outfit_i -= 1
	outfit_reload()

func _on_OutfitPlus_pressed():
	outfit_i = (outfit_i + 1) % parts.OUTFIT_LIST.size()
	outfit_reload()

func _on_NextButton_pressed():
	GlobalVariables.global_hair_i = hair_i
	GlobalVariables.global_eyes_i = eyes_i
	GlobalVariables.global_nose_i = nose_i
	GlobalVariables.global_mouth_i = mouth_i
	GlobalVariables.global_outfit_i = outfit_i
	print(hair_i)
	print(GlobalVariables.global_hair_i)
	get_tree().change_scene("res://Scenes/StorySelect.tscn")

