extends Node3D

#@onready var tournantRougeA = $TournantRougeA
#@onready var tournantRougeB = $TournantRougeB
#@onready var tournantRougeC = $TournantRougeC
#@onready var tournantRougeD = $TournantRougeD
#
#var reseting = false
#var tournantListe
#var tournantStates = [0,0,0,0]
#
#func _ready() -> void:
	#tournantListe = [tournantRougeA, tournantRougeB, tournantRougeC, tournantRougeD]
	#
#func _process(delta: float) -> void:
	#for tournant in tournantListe:
		#var anim = tournant.get_child(0).get_child(1)
		#if anim.is_playing() and !reseting:
			#var index = tournantListe.rfind(tournant)
			#for tournant2 in tournantListe:
				#var index2 = tournantListe.rfind(tournant)
			#tournantStates[index] = 1
	
