extends Node2D

signal button_activated(Link_tag)
signal button_deactivated(Link_tag)






func _on_area_2d_body_entered(body: Node2D) -> void:
	button_activated.emit(get_meta("Link_tag"))
	print("eeere")
	pass # Replace with function body.



func _on_area_2d_body_exited(body: Node2D) -> void:
	print("eeerrr")
	pass # Replace with function body.
