class_name SummonUI
extends Control

signal reparent_requested(which_summon_ui: SummonUI)

@export var stats: Stats : set = set_summon_stats

@onready var stats_ui : StatsUI = $StatsUI
@onready var color_rect : ColorRect = $ColorRect

@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var summon_state_machine: SummonStateMachine = $SummonStateMachine as SummonStateMachine
@onready var targets: Array[Node] = []

var parent: Control

func set_summon_stats(value: Stats) -> void:
	stats = value.create_instance()
	
	if not stats.stats_changed.is_connected(update_stats):
		stats.stats_changed.connect(update_stats)
	
	update_player()
	
func update_player() -> void:
	
	if not stats is Stats:
		return
	
	if not is_inside_tree():
		await ready
	
	update_stats()
	
func update_stats() -> void:
	stats_ui.update_stats(stats)

func take_damage(damage: int) -> void:
	if stats.health <= 0:
		return
	
	stats.take_damage(damage)
	
	if stats.health <= 0:
		queue_free()
	
func _ready() -> void:
	summon_state_machine.init(self)

func _input(event: InputEvent) -> void:
	summon_state_machine.on_input(event)

func _on_gui_input(event: InputEvent) -> void:
	summon_state_machine.on_gui_input(event)
	
func _on_mouse_entered() -> void:
	summon_state_machine.on_mouse_entered()
	
func _on_mouse_exited() -> void:
	summon_state_machine.on_mouse_exited()

func _on_drop_point_detector_area_entered(area):
	if not targets.has(area):
		targets.append(area)

func _on_drop_point_detector_area_exited(area):
	targets.erase(area)
