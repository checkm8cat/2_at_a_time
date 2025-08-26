extends Node2D
var variant = get_meta("Variant")
const MOVE = 1
const JUMP = 2
const CROUCH = 3
signal grabbed









# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var variant = get_meta("Variant")
	
	if(variant == MOVE):
		$Sprite2D.modulate = Color(0, 1, 1, 1)
	if(variant == JUMP):
		$Sprite2D.modulate = Color(1, 0, 1, 1)
	if(variant == CROUCH):
		$Sprite2D.modulate = Color(1, 1, 0, 1)
	pass




func _on_area_2d_body_entered(body: Node2D) -> void:
	grabbed.emit(variant)
	queue_free()
	pass # Replace with function body.
