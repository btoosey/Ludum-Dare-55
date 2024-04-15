extends Node

@onready var summons = $"../World/BattleUI/PlayerHands/Summons"
@onready var enemy_summons = $"../World/BattleUI/EnemyHands/EnemySummons"

var summon_scene = preload("res://scenes/summon_ui/summons/summon_ui.tscn")
var enemy_scene = preload("res://scenes/summon_ui/summons/enemy_ui.tscn")

func create_new_summon(atk, hp) -> void:
	summons.create_summon_child(atk, hp)

func create_new_enemies() -> void:
	enemy_summons.create_enemy_child()
