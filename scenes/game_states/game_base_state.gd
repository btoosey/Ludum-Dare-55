extends GameState

@onready var fight_button = $"../../BattleUI/FightButton"
@onready var summons = $"../../BattleUI/PlayerHands/Summons"
@onready var starmap_button = $"../../BattleUI/StarmapButton"
@onready var summon_button = $"../../BattleUI/SummonButton"
@onready var foreground = $"../../Foreground"

func enter() -> void:
	if summons.get_child_count() >= 4:
		starmap_button.disabled = true
		starmap_button.visible = false
	
	for child in summons.get_children():
		child.draggable = true
	
	var foreground_tween = get_tree().create_tween()
	foreground_tween.tween_property(foreground,"position", Vector2(640,360), 2)
	
	if StarManager.available_stars >= 2:
		starmap_button.disabled = false
		starmap_button.visible = true
	else:
		starmap_button.disabled = true
		starmap_button.visible = false

	summon_button.disabled = true
	summon_button.visible = false

	if summons.get_child_count() == 0:
		fight_button.disabled = true
		fight_button.visible = false
	else:
		fight_button.disabled = false
		fight_button.visible = true

