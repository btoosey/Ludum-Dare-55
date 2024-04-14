class_name EnemyUI
extends Control

@onready var stats_ui : StatsUI = $StatsUI
@export var stats: Stats : set = set_enemy_stats

func set_enemy_stats(value: Stats) -> void:
	stats = value.create_instance()
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)
	
	update_enemy()

func update_stats() -> void:
	stats_ui.update_stats(stats)

func update_enemy() -> void:
	if not stats is Stats:
		return
	
	if not is_inside_tree():
		await ready
	
	update_stats()
	
func take_damage(damage: int) -> void:
	if stats.health <= 0:
		return
	
	stats.take_damage(damage)
	
	if stats.health <= 0:
		queue_free()
