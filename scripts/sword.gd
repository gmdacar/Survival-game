extends Attack
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _ready():
	super()
	animation_player.play("attack")
	damage = 2
	ranger = false
