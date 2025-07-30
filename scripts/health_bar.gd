extends CanvasLayer
@onready var player: CharacterBody2D = %player
@onready var texture_progress_bar: TextureProgressBar = $TextureProgressBar

func _ready() -> void:
	player.connect("signal_hp_changed", Callable(self, "update"))

func update(health, maxhealth):
	texture_progress_bar.max_value = maxhealth
	texture_progress_bar.value = health
