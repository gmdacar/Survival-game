class_name Attack
extends Area2D

var damage = 10
var ranger = false

@onready var sprite_2d: Sprite2D = $Sprite2D

signal closeattacked(damage)

func _ready():
	area_entered.connect(self.attack)
	
	for base_enemy in get_tree().get_nodes_in_group("enemies"):
		connect("closeattacked", Callable(base_enemy, "take_damage"))
	
	collision_mask = 4

func _process(_delta) -> void:
	rotating()

func attack(_area):
	if ranger == false:
		emit_signal("closeattacked", damage)

func rotating():
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	if rotation_degrees > 90 and rotation_degrees < 270:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false

func deleting():
	queue_free()
