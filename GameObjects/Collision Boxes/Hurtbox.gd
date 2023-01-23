extends Area2D

export(bool) var show_hit = true

#const hit_effect = preload("res://Effects/HitEffect.tscn")

onready var timer = $Timer

signal invincibility_started
signal invincibility_ended

var invincible = false

func start_invincibility(duration):
	invincible = true
	emit_signal("invincibility_started")
	timer.start(duration)

func create_hit_effect():
	pass
	

func _on_Timer_timeout():
	emit_signal("invincibility_ended")
	invincible = false


func _on_Hurtbox_invincibility_started():
	set_deferred("monitoring", false)


func _on_Hurtbox_invincibility_ended():
	set_deferred("monitoring", true)

