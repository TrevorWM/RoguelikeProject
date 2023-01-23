extends Node2D


export(int) var MAX_ENEMIES: int = 5
export(int) var SPAWN_TIME: int = 10
export(PackedScene) var ENEMY: PackedScene = preload("res://GameObjects/Enemies/Bat.tscn")

onready var spawnTimer = $Timer

# Called when the node enters the scene tree for the first time.
func _process(_delta):
	if spawnTimer.is_stopped():
		var numEnemies = get_tree().get_nodes_in_group("Enemies").size()
		if numEnemies < MAX_ENEMIES:
			spawn_enemy()


func spawn_enemy():
	if ENEMY:
		var enemy = ENEMY.instance()
		get_tree().current_scene.add_child(enemy)
		enemy.global_position = self.global_position
		
		spawnTimer.start()
