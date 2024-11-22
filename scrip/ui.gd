extends Control

var  invOpen = false

@onready var player = owner


func _input(event: InputEvent) -> void:
	visible = invOpen
	if event.is_action_pressed("Inventory"):
		if invOpen == false:
			invOpen = true
			player.allowAction = false
		elif invOpen == true:
			invOpen = false
			player.allowAction = true

		#try to make so the player cant move if inventory is open and player should not be able to shoot
		
