extends CharacterBody2D


@export var bullet_node : PackedScene
@onready var speed: Timer = $Speed

var can_shoot : bool = false
var ATK = 0

var allowAction = true

@export var Walkspeed = 150

func _physics_process(delta: float) -> void:
	if allowAction == true:
		velocity = Input.get_vector("left","right","up","down") * Walkspeed
	elif allowAction == false:
		velocity = Vector2(0,0)
	move_and_slide()


func _input(event: InputEvent) -> void:
	if allowAction == true:
		if event.is_action_pressed("shoot") and can_shoot:
			shoot()
			speed.start()
		elif event.is_action_released("shoot"):
			speed.stop()


func shoot():
	var bullet = bullet_node.instantiate()
	
	bullet.position = global_position
	bullet.direction = (get_global_mouse_position()- position).normalized()
	
	bullet.find_child("ATK").text = str(ATK)
	
	get_tree().current_scene.add_child(bullet)

func set_speed(base_ATK):
	if base_ATK !=0:
		can_shoot = true
		speed.wait_time = 0.125 * base_ATK
	else:
		can_shoot = false


func _on_speed_timeout() -> void:
	shoot()
