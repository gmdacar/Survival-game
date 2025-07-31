class_name Enemy
extends CharacterBody2D

@onready var timer: Timer = $Timer

var damage = 10
var speed = 2
var hp = 10

var timeout = false

signal signal_player_hit(damage)

func _ready() -> void:
	add_to_group("enemies")

func _process(_delta: float) -> void:
	move_and_slide()

func damage_attacked(_body):
	emit_signal("signal_player_hit", damage)

@warning_ignore("shadowed_variable")
func take_damage(damage):
	if timeout == false:
		
		hp -= damage
		
		timeout = true
		timer.start()
		
		if hp <= 0:
			died()

func died():
	queue_free()

func func_timeout():
	print("ahhhhhhhhhhhhhhhhhh")
	timeout = false
