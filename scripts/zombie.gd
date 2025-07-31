extends Enemy

var _visible = false

@onready var player: CharacterBody2D = %player

func _ready() -> void:
	damage = 5
	speed = 5
	hp = 10
	
	$player_checking.body_entered.connect(player_showen)
	$player_checking.body_exited.connect(player_hidden)

func player_showen(_body):
	_visible = true

func player_hidden(_body):
	_visible = false

func move(delta):
	if _visible:
		velocity = (player.global_position - global_position).normalized() * speed
	else:
		velocity = velocity.move_toward(Vector2.ZERO, speed * delta)

func _physics_process(delta: float):
	move(delta)
