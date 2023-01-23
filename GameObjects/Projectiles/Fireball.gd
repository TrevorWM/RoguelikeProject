extends "res://GameObjects/Collision Boxes/Hitbox.gd"


export(int) var SPEED: int = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta



func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
