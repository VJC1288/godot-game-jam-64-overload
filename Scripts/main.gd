extends Node2D

const PLAYER = preload("res://Scenes/player.tscn")
const PAUSEMENU = preload("res://Scenes/pausemenu.tscn")

@onready var weapon_1 = $Weapon1

# Called when the node enters the scene tree for the first time.
func _ready():
	spawn_player()
	
func _process(_delta):
	if Input.is_action_just_pressed("pause") and Globals.paused == false:
		pause_game()
		
func pause_game():
	add_child(PAUSEMENU.instantiate())
	get_tree().paused = true
	
func spawn_player():
	var player = PLAYER.instantiate()
	var viewport = get_viewport_rect()
	player.global_position = Vector2(viewport.size.x / 2, viewport.size.y / 2)
	Globals.currentPlayer = player
	add_child(player)
	weapon_1.wpn1Pickup_sig.connect(equip_wpn1)
	
func equip_wpn1():
	Globals.currentPlayer.weapon_1.show()
