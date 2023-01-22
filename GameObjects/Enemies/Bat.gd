extends Area2D

export(NodePath) var playerNode
export (int) var MAX_SPEED: int = 100

var velocity = Vector2.ZERO


onready var sprite = $Sprite
onready var player = get_node(playerNode)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if player != null:
		accelerate_towards_point(player.global_position, delta)


func accelerate_towards_point(point, delta):
	var direction_vector = global_position.direction_to(point)
	velocity = velocity.move_toward(direction_vector * MAX_SPEED, delta)
	sprite.flip_h = velocity.x < 0
