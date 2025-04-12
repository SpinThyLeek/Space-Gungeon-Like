extends CharacterBody2D

const SPEED = 5.0
const JUMP_VELOCITY = -400.0
var canShoot = 0
@onready var photon = load("res://photon.tscn")
@onready var main = owner

func getMovementInput():
	if abs(velocity.x) < 300:
		velocity.x += (int(Input.is_action_pressed("right_Key")) - int(Input.is_action_pressed("left_Key"))) * SPEED
	else:
		velocity.x = (int(Input.is_action_pressed("right_Key")) - int(Input.is_action_pressed("left_Key"))) * 300.0
	if abs(velocity.y) < 300:
		velocity.y += (int(Input.is_action_pressed("down_Key")) - int(Input.is_action_pressed("up_Key"))) * SPEED
	else:
		velocity.y = (int(Input.is_action_pressed("down_Key")) - int(Input.is_action_pressed("up_Key"))) * 300
	
	
func blastEm():
	if Input.is_action_pressed("shoot") && canShoot <= 0:
		var instance = photon.instantiate()
		instance.dir = rotation
		instance.spawnPos = global_position
		instance.spawnDir = rotation
		instance.zdex = z_index-1
		main.add_child.call_deferred(instance)
		canShoot=5
	canShoot-=1

func _physics_process(delta: float) -> void:
	z_index = 2
	getMovementInput()
	look_at(get_global_mouse_position())
	rotation += deg_to_rad(90)
	move_and_slide()
	
	blastEm()
