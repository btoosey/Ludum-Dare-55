extends SummonState

var played: bool

func enter() -> void:
	summon_ui.state.text = "RELEASED"
	
	played = false
	
	if not summon_ui.targets.is_empty():
		played = true
		print("play", summon_ui ,"for targets:", summon_ui.targets)
		summon_ui.targets[0].assign_summon.emit(summon_ui)
		
		transition_requested.emit(self, SummonState.State.BASE)
		

	
func on_input(_event: InputEvent) -> void:
	transition_requested.emit(self, SummonState.State.BASE)
