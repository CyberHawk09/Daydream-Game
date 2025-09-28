extends CharacterBody2D

@export var speed = 800
@onready var hitbox = $Hitbox

func _ready():
	add_to_group("player")
	hitbox.body_entered.connect(_on_enemy_entered)

func _physics_process(_delta):
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed
	move_and_slide()

func _on_enemy_entered(body):
	if body.is_in_group("enemy"):
		print("Player hit by enemy!")
		# Switch to game over scene
		get_tree().change_scene_to_file("res://game_over.tscn")
