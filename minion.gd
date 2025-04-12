extends CharacterBody2D


const SPEED = 30
const JUMP_VELOCITY = -400.0
var health = 10
var damage = 2.0
var vel = Vector2(0,1) * -SPEED
@onready var winner = load("res://win!.tscn")

func _physics_process(delta: float) -> void:
	velocity = vel
	move_and_slide()
	
	damageIndicator()
	damage+=1
	if health <= 0:
		explosionIndicator()

func damageIndicator() -> void:
	if damage < 2:
		visible = false
	else:
		visible = true

func _on_area_2d_area_entered(area: Area2D) -> void:
	damage = 0
	health -= 1
	if health <= 0:
		$AnishExplodeSfx.play()
		vel = Vector2(0,0)
	else:
		$Area2D/RealCalebFreestyle.play()
		

func explosionIndicator() -> void:
	if damage % 2 == 0:
		visible = true
	else:
		visible = false

func _on_anish_explode_sfx_finished() -> void:
	$AspectRatioContainer/VideoStreamPlayer.play()
	$AspectRatioContainer/RealCalebFreestyleFinality.play()


func _on_video_stream_player_finished() -> void:
	var inst =  winner.instantiate()
	add_child(inst)
	#queue_free()
