extends Control

@onready var star_image = $StarImage

var available: bool = true
var clickable: bool = false
var hovered: bool = false
var selected: bool = false
@export var star_distance: int

@export var star: Star : set = set_star_stats
var health_points: int
var attack_points: int

func set_star_stats(value: Star) -> void:
	if not is_node_ready():
		await ready
	
	star = value
	health_points = star.health_points
	attack_points = star.attack_points
	star_image.texture = star.star_image_default

func toggle_clickable() -> void:
	clickable = !clickable

func _on_area_2d_mouse_entered():
	if StarManager.available_stars <= 0:
		return

	if not clickable:
		return

	if not available:
		return

	hovered = true
	update_star_image()

func _on_area_2d_mouse_exited():
	hovered = false
	update_star_image()
	
func _input(event):
	if StarManager.available_stars <= 0:
		return

	if not clickable:
		return
	
	if not hovered:
		return
	
	if event.is_action_pressed("left_mouse"):
		
		var star_position = position
		
		if (StarManager.temp_constellation.is_empty()):
			StarManager.temp_constellation.append(self)
			selected = true
			StarManager.available_stars -= 1
		elif (StarManager.temp_constellation.size() == 1):
			if StarManager.temp_constellation[-1] != self and star_position.distance_to(StarManager.temp_constellation[-1].position) < star_distance:
				StarManager.temp_constellation.append(self)
				selected = true
				StarManager.available_stars -= 1
		elif (StarManager.temp_constellation.size() > 1 and (StarManager.temp_constellation[-1] != self and StarManager.temp_constellation[-2] != self)) and star_position.distance_to(StarManager.temp_constellation[-1].position) < star_distance:
			StarManager.temp_constellation.append(self)
			selected = true
			StarManager.available_stars -= 1

func update_star_image() -> void:
	if (hovered or selected) or !available:
		star_image.texture = star.star_image_selected
	else:
		star_image.texture = star.star_image_default
