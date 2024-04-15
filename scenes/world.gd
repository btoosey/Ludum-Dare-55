extends Node2D

@onready var game_state_machine: GameStateMachine = $GameStateMachine as GameStateMachine
@onready var fight_button = $BattleUI/FightButton
@onready var starmap_button = $BattleUI/StarmapButton
@onready var summon_button = $BattleUI/SummonButton
@onready var available_stars_label = $BattleUI/AvailableStarsLabel
@onready var level_label = $BattleUI/LevelLabel

# Called when the node enters the scene tree for the first time.
func _ready():
		game_state_machine.init()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	available_stars_label.text = str(StarManager.available_stars)
	level_label.text = "LEVEL " + str(LevelManager.current_level)

func _on_fight_button_pressed():
	fight_button.visible = false
	starmap_button.visible = false
	summon_button.visible = false
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.BATTLE)

func _on_starmap_button_pressed():
	starmap_button.visible = false
	fight_button.visible = false
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.TELESCOPE)

func _on_summon_button_pressed():
	StarManager.commit_constellation()
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.BASE)
