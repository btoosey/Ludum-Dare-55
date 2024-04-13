class_name SummonUI
extends Control

signal reparent_requested(which_summon_ui: SummonUI)

@export var summon: Summon

@onready var state: Label = $state
@onready var drop_point_detector: Area2D = $DropPointDetector
@onready var summon_state_machine: SummonStateMachine = $SummonStateMachine as SummonStateMachine
@onready var targets: Array[Node] = []

var parent: Control

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
