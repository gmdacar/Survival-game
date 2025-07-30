class_name Attack
extends Area2D

var damage = 10
var ranger = false

signal closeattacked(damage)

func created():
	for base_enemy in get_tree().get_nodes_in_group("enemies"):
		connect("closeattacked", Callable(base_enemy, "take_damage"))
	collision_mask = 4

func _ready():
	created()
	area_entered.connect(self.attack)

@warning_ignore("unused_parameter")
func attack(area):
	print("attack!")
	if ranger == false:
		emit_signal("closeattacked", damage)

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass
