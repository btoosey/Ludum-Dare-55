class_name SummonHand
extends HBoxContainer

func _ready():
	for child in get_children():
		var summon_ui := child as SummonUI
		summon_ui.parent = self
		summon_ui.reparent_requested.connect(_on_summon_ui_reparent_requested)

func _on_summon_ui_reparent_requested(child: SummonUI) -> void:
	child.reparent(self)
