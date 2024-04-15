extends GameState
@onready var foreground = $"../../Foreground"
@onready var summons = $"../../BattleUI/PlayerHands/Summons"

func enter():
	for child in summons.get_children():
			child.draggable = false

	await get_tree().create_timer(1).timeout
	var foreground_tween = get_tree().create_tween()
	foreground_tween.tween_property(foreground,"position", Vector2(640,440), 2)
