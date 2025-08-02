class_name Attack
extends Area2D

var damage = 10
var ranger = false

@onready var sprite_2d: Sprite2D = $Sprite2D

signal closeattacked(damage)

func _ready():
	area_entered.connect(self.attack)
	
	collision_mask = 4

func _process(_delta) -> void:
	rotating()

func attack(area):
	connect("closeattacked", Callable(area.get_parent(), "take_damage"))
	if ranger == false:
		emit_signal("closeattacked", damage)
	disconnect("closeattacked", Callable(area.get_parent(), "take_damage"))

func rotating():
	look_at(get_global_mouse_position())
	
	rotation_degrees = wrap(rotation_degrees, 0, 360)
	
	if rotation_degrees > 90 and rotation_degrees < 270:
		sprite_2d.flip_h = true
	else:
		sprite_2d.flip_h = false

func deleting():
	queue_free()
