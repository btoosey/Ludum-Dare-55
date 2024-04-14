class_name StatsUI
extends HBoxContainer

@onready var health: VBoxContainer = $Health
@onready var health_label: Label = %HealthLabel
@onready var attack: VBoxContainer = $Attack
@onready var attack_label: Label = %AttackLabel

func update_stats(stats) -> void:
	health_label.text = str(stats.health)
	attack_label.text = str(stats.attack)
