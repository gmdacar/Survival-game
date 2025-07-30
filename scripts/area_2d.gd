extends Area2D

@onready var label: Label = $Label

func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

@warning_ignore("unused_parameter")
func _on_body_entered(body: Node2D) -> void:
	label.show()

@warning_ignore("unused_parameter")
func _on_body_exited(body: Node2D) -> void:
	label.hide()
