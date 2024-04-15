class_name EnemyHand
extends HBoxContainer

const ENEMY_UI_SCENE = preload("res://scenes/summon_ui/summons/enemy_ui.tscn")

func create_enemy_child() -> void:
	var new_enemy_ui := ENEMY_UI_SCENE.instantiate() as EnemyUI
	add_child(new_enemy_ui)
	new_enemy_ui.increase_stats(LevelManager.current_level, LevelManager.current_level)
