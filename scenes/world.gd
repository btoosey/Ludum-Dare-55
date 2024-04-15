extends Node2D

@onready var game_state_machine: GameStateMachine = $GameStateMachine as GameStateMachine
@onready var fight_button = $BattleUI/FightButton
@onready var summon_button = $BattleUI/SummonButton

# Called when the node enters the scene tree for the first time.
func _ready():
		game_state_machine.init()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_fight_button_pressed():
	fight_button.visible = false
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.BATTLE)

func _on_summon_button_pressed():
	summon_button.visible = false
	game_state_machine._on_transition_requested(game_state_machine.current_state, GameState.State.TELESCOPE)
