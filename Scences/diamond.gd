extends CharacterBody2D

var time = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	time += delta
	global_position.y += _floating() * delta


func _floating():
	return sin(5*time) * 50
	



func _on_area_2d_body_entered(body):
	print("WINNER")
	queue_free()
