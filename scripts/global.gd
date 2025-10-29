extends Node

func _ready() -> void:
	SilentWolf.configure({
		"api_key": "6HfJmFfH0w4mm8FDS9SKP69cf4OytO0H2VgMZ8Uy",
		"game_id": "pushit",
		"log_level": 1
	})

	SilentWolf.configure_scores({
		"open_scene_on_close": "res://scenes/main.tscn"
	})

	if has_node("LoadingLabel"):
		$LoadingLabel.text = "Chargement du classement..."
		$LoadingLabel.visible = true

	SilentWolf.Scores.connect("scores_received", Callable(self, "_on_scores_received"))

	SilentWolf.Scores.get_scores(10)

func _on_scores_received(scores):
	if has_node("LoadingLabel"):
		$LoadingLabel.visible = false

	for i in range(len(scores)):
		var s = scores[i]
		print("%d. %s - %d" % [i + 1, s["player_name"], s["score"]])
