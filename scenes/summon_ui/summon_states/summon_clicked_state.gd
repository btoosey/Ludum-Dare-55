extends SummonState

func enter() -> void:
	#summon_ui.state.text = "CLICKED"
	summon_ui.drop_point_detector.monitoring = true

	
func on_input(event: InputEvent) -> void:
	if not summon_ui.draggable:
		return
	if event is InputEventMouseMotion:
		transition_requested.emit(self, SummonState.State.DRAGGING)

