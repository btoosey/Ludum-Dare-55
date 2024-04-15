class_name Stats
extends Resource

signal stats_changed

@export var max_health: int
@export var attack: int
#@export var sprite: Texture

@export var health: int: set = set_health

func set_health(value: int) -> void:
	health = clampi(value, 0, max_health)
	stats_changed.emit()
	
func take_damage(damage: int) -> void:
	if damage <= 0:
		return
	
	self.health -= damage

func increase_stats(atk: int, hp: int) -> void:
	self.attack += atk
	self.health += hp

func create_instance() -> Resource:
	var instance: Stats = self.duplicate()
	instance.health = health
	return instance
