extends Node2D

signal button_activated(Link_Tag)
signal button_deactivated(Link_Tag)




func _on_area_2d_area_entered(area: Area2D) -> void:
	button_activated.emit(get_meta("Link_Tag"))
	print("AHHHH")
	pass # Replace with function body.


func _on_area_2d_area_exited(area: Area2D) -> void:
	
	pass # Replace with function body.
