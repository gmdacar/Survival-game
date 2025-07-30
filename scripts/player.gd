extends CharacterBody2D

var speed = 30
var health = 256
var maxhealth = 256

signal signal_hp_changed(health, maxhealth)

func _ready() -> void:
	hp_changed()
	for base_enemy in get_tree().get_nodes_in_group("enemies"):
		base_enemy.connect("player_hit", (Callable(self, "take_damage")))

@warning_ignore("unused_parameter")
func _process(delta: float) -> void:
	attack()
	move_input()
	move_and_slide()

func move_input(): #получение вектора игрока
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * speed

func attack():
	if Input.is_action_just_pressed("attack"):
		var sword_scene = load("res://scenes/nodes/attacks/sword.tscn")
		var sword = sword_scene.instantiate()
		add_child(sword)

func take_damage(damage):
	hp_changed()
	health -= damage
	print(health)
	if health <= 0:
		died()

func died():
	print("you died")

func hp_changed():
	emit_signal("signal_hp_changed", health, maxhealth)
