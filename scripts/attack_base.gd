class_name Attack
extends Area2D

var damage = 10
var ranger = false

signal closeattacked(damage)

func _ready():
	area_entered.connect(self.attack)
	
	for base_enemy in get_tree().get_nodes_in_group("enemies"):
		connect("closeattacked", Callable(base_enemy, "take_damage"))
	
	collision_mask = 4

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	pass

@warning_ignore("unused_parameter")
func attack(area):
	if ranger == false:
		emit_signal("closeattacked", damage)
