extends GameState

@onready var battle_ui = $"../../BattleUI"
@onready var foreground = $"../../Foreground"
@onready var title = $"../../Title/Title"

# Called when the node enters the scene tree for the first time.
func enter():
	LevelManager.current_level = 1
	await get_tree().create_timer(2.8).timeout
	var foreground_tween = get_tree().create_tween()
	foreground_tween.parallel().tween_property(foreground,"position", Vector2(640,360), 3)
	var title_tween = get_tree().create_tween()
	title_tween.tween_property(title,"position", Vector2(368,900), 4.3)
	await get_tree().create_timer(3).timeout
	transition_requested.emit(self, GameState.State.BASE)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func exit():
	battle_ui.visible = true
	SummonManager.create_new_enemies()
	title.visible = false
