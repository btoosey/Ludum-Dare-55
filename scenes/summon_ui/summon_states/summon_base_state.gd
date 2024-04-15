extends SummonState

var summon_ui_hovered := false

func enter() -> void:
	if not summon_ui.is_node_ready():
		await summon_ui.ready
	
	summon_ui.reparent_requested.emit(summon_ui)
	#summon_ui.state.text = "BASE"
	summon_ui.pivot_offset = Vector2.ZERO
	summon_ui.stats_ui.visible = true

func on_gui_input(event: InputEvent) -> void:
	if event.is_action_pressed("left_mouse") and summon_ui_hovered:
		summon_ui.pivot_offset = summon_ui.get_global_mouse_position() - summon_ui.global_position
		transition_requested.emit(self, SummonState.State.CLICKED)

func on_mouse_entered() -> void:
	summon_ui_hovered = true
	
func on_mouse_exited() -> void:
	summon_ui_hovered = false
