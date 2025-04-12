extends CharacterBody2D

const SPEED = 500

var dir : float
var spawnPos : Vector2
var spawnDir : float
var zdex : int

func _ready():
	global_position = spawnPos
	global_rotation = spawnDir
	z_index = zdex
	
func _physics_process(delta: float) -> void:
	velocity = Vector2(0, -SPEED).rotated(dir)
	move_and_slide()
	


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_2d_area_entered(area: Area2D) -> void:
	queue_free()
