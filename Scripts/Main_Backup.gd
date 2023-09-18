extends Node2D

var hair_pics = [] 
var eye_pics = []
var nose_pics = []
var mouth_pics = []
var outfit_pics = []

var rng = RandomNumberGenerator.new()

func _ready():
	hair_pics = get_images("res://Assets/Parts/Hair")
	eye_pics = get_images("res://Assets/Parts/Eyes")
	nose_pics = get_images("res://Assets/Parts/Nose")
	mouth_pics = get_images("res://Assets/Parts/Mouth")
	outfit_pics = get_images("res://Assets/Parts/Outfit")

func get_images(folder_path):
	var _pics = []
	var dir = Directory.new()
	dir.open(folder_path)
	dir.list_dir_begin()
	while true:
		var file_name = dir.get_next()
		if file_name == "":
			#break the while loop when get_next() returns ""
			break
		elif !file_name.begins_with(".") and file_name.ends_with(".import"):
		#get_next() returns a string so this can be used to load the images into an array.
			file_name = file_name.replace(".import", "")
			_pics.append(load(folder_path + "/" + file_name))
	dir.list_dir_end()
	_pics.sort()
	return _pics

var HAIR_LIST = ["Hair", "Sarah", "Charles"]
var hair_i : int = 0
func _on_HairButton_pressed():
	var pics_count = hair_pics.size()
	if (hair_i >= (pics_count-1)): hair_i = 0
	else: hair_i += 1
	$Hair.texture = load(hair_pics[hair_i].get_path())
	print(HAIR_LIST[hair_i])
	$VBoxContainer/HairButton.text = str(HAIR_LIST[hair_i])


var EYE_LIST = ["Eyes", "Sarah", "Hoël"]
var eyes_i : int = 0
func _on_EyesButton_pressed():
	var pics_count = eye_pics.size()
	if (eyes_i >= (pics_count-1)): eyes_i = 0
	else: eyes_i += 1
	$Eyes.texture = load(eye_pics[eyes_i].get_path())
	$VBoxContainer/EyesButton.text = str(EYE_LIST[eyes_i])

var NOSE_LIST = ["Nose", "Trevor", "Sarah", "Hoël"]
var nose_i : int = 0
func _on_NoseButton_pressed():
	var pics_count = nose_pics.size()
	if (nose_i >= (pics_count-1)): nose_i = 0
	else: nose_i += 1
	$Nose.texture = load(nose_pics[nose_i].get_path())
	$VBoxContainer/NoseButton.text = str(NOSE_LIST[nose_i])

var MOUTH_LIST = ["Mouth", "Sarah", "Hoël"]
var mouth_i : int = 0
func _on_MouthButton_pressed():
	var pics_count = mouth_pics.size()
	print(pics_count)
	if (mouth_i >= (pics_count-1)): mouth_i = 0
	else: mouth_i += 1
	$Mouth.texture = load(mouth_pics[mouth_i].get_path())
	$VBoxContainer/MouthButton.text = str(MOUTH_LIST[mouth_i])
	
var OUTFIT_LIST = ["Outfit", "Sarah", "Hoël"]
var outfit_i : int = 0
func _on_OutfitButton_pressed():
	var pics_count = outfit_pics.size()
	if (outfit_i >= (pics_count-1)): outfit_i = 0
	else: outfit_i += 1
	$Outfit.texture = load(outfit_pics[outfit_i].get_path())
	$VBoxContainer/OutfitButton.text = str(OUTFIT_LIST[outfit_i])

func _on_Button_pressed():
	var image = get_viewport().get_texture().get_data()
	image.flip_y()
	var buf = image.save_png_to_buffer()
	JavaScript.download_buffer(buf, "wiesner-baby.png")



func _on_Randomizer_pressed():
	hair_i = rng.randi_range(0, hair_pics.size()-1)
	$Hair.texture = load(hair_pics[hair_i].get_path())
	$VBoxContainer/HairButton.text = str(HAIR_LIST[hair_i])
	
	eyes_i = rng.randi_range(0, hair_pics.size()-1)
	$Eyes.texture = load(eye_pics[eyes_i].get_path())
	$VBoxContainer/EyesButton.text = str(EYE_LIST[eyes_i])
	
	nose_i = rng.randi_range(0, nose_pics.size()-1)
	$Nose.texture = load(nose_pics[nose_i].get_path())
	$VBoxContainer/NoseButton.text = str(NOSE_LIST[nose_i])
	
	mouth_i = rng.randi_range(0, mouth_pics.size()-1)
	$Mouth.texture = load(mouth_pics[mouth_i].get_path())
	$VBoxContainer/MouthButton.text = str(MOUTH_LIST[mouth_i])
	
	outfit_i = rng.randi_range(0, outfit_pics.size()-1)
	$Outfit.texture = load(outfit_pics[outfit_i].get_path())
	$VBoxContainer/OutfitButton.text = str(OUTFIT_LIST[outfit_i])
