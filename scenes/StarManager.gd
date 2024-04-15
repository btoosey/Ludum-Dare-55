extends Node2D

var temp_constellation: Array = []
var constellations: Array = []
var stars: Array = []
var available_stars: int
# Called when the node enters the scene tree for the first time.
func _ready():
	stars = get_tree().get_nodes_in_group("stars")
	available_stars = 4
	
func toggle_clickable() -> void:
	get_tree().call_group("stars", "toggle_clickable")

func commit_constellation() -> void:
	if temp_constellation.size() >= 3:
		constellations.append(temp_constellation)
		
		for star in temp_constellation:
			star.available = false
			star.selected = false
			star.hovered = false
		temp_constellation = []

func _draw():
	for star in temp_constellation:
		draw_line(star.position, temp_constellation[star + 1].position, Color.WHITE)
