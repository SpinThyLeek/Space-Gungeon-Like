extends Node2D
var count = 0
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	count+=1
	if count % 5 == 0:
		visible = !visible
