extends KinematicBody2D

export (int) var MAX_SPEED: int = 75

var velocity = Vector2.ZERO


onready var sprite = $Sprite
onready var player = get_parent().get_node("Player")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	if player != null:
		accelerate_towards_point(player.global_position)
	
	velocity = move_and_slide(velocity)


func accelerate_towards_point(point):
	var direction_vector = global_position.direction_to(point)
	velocity = direction_vector * MAX_SPEED
	sprite.flip_h = velocity.x < 0



func _on_Hurtbox_area_entered(area):
	queue_free()
