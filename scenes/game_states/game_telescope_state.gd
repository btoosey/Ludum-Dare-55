extends GameState
@onready var foreground = $"../../Foreground"
@onready var summons = $"../../BattleUI/PlayerHands/Summons"
@onready var summon_button = $"../../BattleUI/SummonButton"

func enter():
	for child in summons.get_children():
			child.draggable = false

	await get_tree().create_timer(0.6).timeout
	var foreground_tween = get_tree().create_tween()
	foreground_tween.tween_property(foreground,"position", Vector2(640,440), 1.5)
	StarManager.toggle_clickable()

func _process(_delta):
	if StarManager.temp_constellation.size() >= 2:
		summon_button.visible = true
		summon_button.disabled = false

func exit():
	StarManager.toggle_clickable()
