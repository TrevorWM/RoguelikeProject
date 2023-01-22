extends KinematicBody2D

export(int) var MAX_SPEED: int = 100
export (int) var health: int = 10
var velocity = Vector2.ZERO

onready var sprite = $Sprite

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	process_movement()
	process_click()
	
# Processes the movement based on the user input.
func process_movement():
	var input_vector = Vector2.ZERO
	
	
	input_vector.x = int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left"))
	input_vector.y = int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		velocity = input_vector * MAX_SPEED
		sprite.flip_h = velocity.x < 0
	else:
		velocity = Vector2.ZERO
	
	velocity = move_and_slide(velocity)

func process_click():
	if Input.is_action_just_pressed("ui_click"):
		print("Shoot")
		#TODO: Shoot Fireball I promise
