extends CharacterBody2D


var movespeed = 50

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):
		%AnimationPlayer.play("attack")

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * movespeed
	move_and_slide()
	
	if velocity.length() > 0.0:
		%AnimationPlayer.play("walk")
	else:
		%AnimationPlayer.play("idle")
