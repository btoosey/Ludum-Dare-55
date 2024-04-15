extends GameState

@onready var summons = $"../../BattleUI/PlayerHands/Summons"
@onready var enemy_summons = $"../../BattleUI/EnemyHands/EnemySummons"
@onready var round_end_label = $"../../BattleUI/RoundEndLabel"

var first_summon
var first_enemy

func enter():
	for child in summons.get_children():
		child.draggable = false

	start_battle()

func start_battle() -> void:
	check_battle_outcome()
	

func check_battle_outcome() -> void:
	assign_firsts()
	if not first_enemy and not first_summon:
		round_end_label.text = "ROUND DRAWN!"
		round_end_label.visible = true
		await get_tree().create_timer(3).timeout
		round_end_label.visible = false
		transition_requested.emit(self, GameState.State.BASE)
	elif not first_enemy and first_summon:
		round_end_label.text = "ROUND WON!"
		round_end_label.visible = true
		await get_tree().create_timer(3).timeout
		round_end_label.visible = false
		transition_requested.emit(self, GameState.State.BASE)
		return
	elif not first_summon and first_enemy:
		round_end_label.text = "ROUND LOST!"
		round_end_label.visible = true
		await get_tree().create_timer(3).timeout
		round_end_label.visible = false
		transition_requested.emit(self, GameState.State.BASE)
	else:
		damage_loop()

func assign_firsts() -> void:
	if summons.get_child_count() == 0:
		first_summon = null
	else:
		first_summon = summons.get_child(0)
		
	if enemy_summons.get_child_count() == 0:
		first_enemy = null
	else:
		first_enemy = enemy_summons.get_child(0)

func damage_loop() -> void:
	var summon_attack = first_summon.stats.attack
	var enemy_summon_attack = first_enemy.stats.attack
	await get_tree().create_timer(1).timeout
	first_summon.take_damage(enemy_summon_attack)
	first_enemy.take_damage(summon_attack)
	await get_tree().create_timer(0.1).timeout	
	assign_firsts()
	
	check_battle_outcome()
