extends GameState

@onready var fight_button = $"../../BattleUI/FightButton"
@onready var summons = $"../../BattleUI/PlayerHands/Summons"
@onready var summon_button = $"../../BattleUI/SummonButton"

func enter() -> void:
	if summons.get_child_count() == 0:
		fight_button.disabled = true
		fight_button.visible = false
		summon_button.disabled = false
		summon_button.visible = true
	else:
		fight_button.disabled = false
		fight_button.visible = true
		summon_button.disabled = true
		summon_button.visible = false
