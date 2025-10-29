extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
  SilentWolf.configure({
	"api_key": "6HfJmFfH0w4mm8FDS9SKP69cf4OytO0H2VgMZ8Uy",
	"game_id": "pushit",
	"log_level": 1
  })

  SilentWolf.configure_scores({
	"open_scene_on_close": "res://scenes/main.tscn"
  })
