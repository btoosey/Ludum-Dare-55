extends Node2D

var temp_constellation: Array = []
var constellations: Array = []
var stars: Array = []
var available_stars: int
var star_line_from: Vector2
var star_line_to: Vector2
var pos_array

func _ready():
	stars = get_tree().get_nodes_in_group("stars")
	available_stars = 2
	
func toggle_clickable() -> void:
	get_tree().call_group("stars", "toggle_clickable")

func commit_constellation() -> void:
	if temp_constellation.size() >= 2:
		var extra_attack = 0
		var extra_health = 0
		for star in temp_constellation:
			extra_attack += star.attack_points
			extra_health += star.health_points
		constellations.append(temp_constellation)
		queue_redraw()
		SummonManager.create_new_summon(extra_attack, extra_health)

		for star in temp_constellation:
			star.available = false
			star.selected = false
			star.hovered = false
		temp_constellation = []

func _draw():
	draw_line(star_line_from,star_line_to, Color.GREEN, 1)
	var from: Vector2
	var to: Vector2
	for i in (temp_constellation.size() - 1):
		from = Vector2(temp_constellation[i].position.x,temp_constellation[i].position.y)
		to = Vector2(temp_constellation[i + 1].position.x,temp_constellation[i +1].position.y)
		draw_line(temp_constellation[i].get_global_position(), temp_constellation[i + 1].get_global_position(), Color.WHITE, 1)
	draw_line(from, to, Color.GREEN, 3.0)
	
	
