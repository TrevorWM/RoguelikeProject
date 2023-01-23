extends "res://GameObjects/Collision Boxes/Hitbox.gd"


export(int) var SPEED: int = 100

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var direction = Vector2.RIGHT.rotated(rotation)
	global_position += SPEED * direction * delta

func destroy():
	queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()


func _on_Fireball_area_entered(_area):
	destroy()


func _on_Fireball_body_entered(_body):
	destroy()
