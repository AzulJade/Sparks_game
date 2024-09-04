extends CharacterBody2D

@onready var follower = get_parent()

@export var speed = 500



func _physics_process(delta):
	follower.set_progress(follower.get_progress()+speed*delta)
