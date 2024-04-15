class_name SummonHand
extends HBoxContainer

const SUMMON_UI_SCENE = preload("res://scenes/summon_ui/summons/summon_ui.tscn")

func _ready():
	for child in get_children():
		var summon_ui := child as SummonUI
		summon_ui.parent = self
		summon_ui.reparent_requested.connect(_on_summon_ui_reparent_requested)

func _on_summon_ui_reparent_requested(child: SummonUI) -> void:
	child.reparent(self)

func create_summon_child(atk, hp) -> void:
	var new_summon_ui := SUMMON_UI_SCENE.instantiate() as SummonUI
	add_child(new_summon_ui)
	new_summon_ui.reparent_requested.connect(_on_summon_ui_reparent_requested)
	new_summon_ui.parent = self
	new_summon_ui.stats.increase_stats(atk, hp)

