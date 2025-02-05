extends CanvasLayer


@onready var settings = $"."
@onready var master_volume = %MasterVolume
@onready var master_slider = %MasterSlider
@onready var music_volume = %MusicVolume
@onready var music_slider = %MusicSlider
@onready var sound_effects_volume = %SoundEffectsVolume
@onready var sound_effects_slider = %SoundEffectsSlider


var settings_open: bool = false



func _ready():
	master_volume.text = str("Master Volume: ", master_slider.value)
	music_volume.text = str("Music Volume: ",music_slider.value)
	sound_effects_volume.text = str("Sound Effects Volume: ",sound_effects_slider.value)
	
	var bus_index = AudioServer.get_bus_index("Master")
	var db_volume = master_slider.value / 3.333 - 30
	if db_volume == -30: 		
		AudioServer.set_bus_mute(bus_index, true) 		
		AudioServer.set_bus_volume_db(bus_index, db_volume) 	
	else: 		
		AudioServer.set_bus_mute(bus_index, false) 		
		AudioServer.set_bus_volume_db(bus_index, db_volume)


func open_settings():
	settings.visible = true
	settings_open = true
	
func close_settings():
	settings.visible = false
	settings_open = false

func _on_master_slider_value_changed(value):
	master_volume.text = str("Master Volume: ", master_slider.value)
	var bus_index = AudioServer.get_bus_index("Master")
	var db_volume = value / 3.333 - 30
	if db_volume == -30: 		
		AudioServer.set_bus_mute(bus_index, true) 		
		AudioServer.set_bus_volume_db(bus_index, db_volume) 	
	else: 		
		AudioServer.set_bus_mute(bus_index, false) 		
		AudioServer.set_bus_volume_db(bus_index, db_volume)
	
func _on_music_slider_value_changed(value):
	music_volume.text = str("Music Volume: ",music_slider.value)
	var bus_index = AudioServer.get_bus_index("Music")
	var db_volume = value / 3.333 - 30
	if db_volume == -30: 		
		AudioServer.set_bus_mute(bus_index, true) 		
		AudioServer.set_bus_volume_db(bus_index, db_volume) 	
	else: 		
		AudioServer.set_bus_mute(bus_index, false) 		
		AudioServer.set_bus_volume_db(bus_index, db_volume)
	
func _on_sound_effects_slider_value_changed(value):
	sound_effects_volume.text = str("Sound Effects Volume: ",sound_effects_slider.value)
	var bus_index = AudioServer.get_bus_index("SFX")
	var db_volume = value / 3.333 - 30
	if db_volume == -30: 		
		AudioServer.set_bus_mute(bus_index, true) 		
		AudioServer.set_bus_volume_db(bus_index, db_volume) 	
	else: 		
		AudioServer.set_bus_mute(bus_index, false) 		
		AudioServer.set_bus_volume_db(bus_index, db_volume)
