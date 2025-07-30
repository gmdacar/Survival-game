class_name Enemy
extends CharacterBody2D

var damage = 10
var speed = 2
var hp = 10
signal player_hit(damage)

func _ready() -> void:
	add_to_group("enemies")

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	move_and_slide()

@warning_ignore("unused_parameter")
func damage_attacked(body):
	emit_signal("player_hit", damage)

@warning_ignore("shadowed_variable")
func take_damage(damage):
	hp -= damage
	if hp <= 0:
		died()

func died():
	print("enemy died")
