extends CharacterBody2D

@onready var Animations = $AnimationTree
@onready var Sprite = $Ghost
@onready var State = $Label
@onready var Dash_timer = $Timer
@onready var Direction = $Direction_handler

var is_jumping = false
var max_jump_height = -500
var min_jump_height = -200
var dash_speed = 500
var move_speed = 300
var move_direction = 1
var gravity = 1000
var is_grounded
var is_dashing = false
var can_dash = true

# the ready function sets the player up
func _ready():
	is_grounded = is_on_floor()
	set_floor_snap_length(8)

#handles the normal gravity for the charater
func _handle_player_movement(delta):
	_gravity(delta)
	move_and_slide()
	if is_on_floor():
		can_dash = true



#gets the move direction for the player charater
func _handle_move_direction():
	move_direction = -int(Input.is_action_pressed("Left")) +int(Input.is_action_pressed("Right"))
	velocity.x = lerpf(velocity.x,move_direction*move_speed,1)
	if move_direction == 0:
		move_direction = Direction.scale.x

# the gravity for the player
func _gravity(delta):
	velocity.y += gravity * delta

# sets the horiszontal position of the player sprite
func _handle_sprite_status():
	if move_direction == -1:
		Sprite.flip_h = true
		Direction.scale.x = -1
	if move_direction == 1:
		Sprite.flip_h = false
		Direction.scale.x = 1

# handles the jump input
func _handle_jump_input():
	if Input.is_action_pressed("Jump") and is_on_floor():
		_max_Jump()
		is_jumping = true
	if Input.is_action_just_released("Jump") and velocity.y < min_jump_height:
		_min_Jump()

# sets the jump velocity to the max
func _max_Jump():
	velocity.y = max_jump_height

# set the jump height to the minimum
func _min_Jump():
	velocity.y = min_jump_height

func _is_jumping():
	if is_on_floor() == true:
		is_jumping = false

# handles dash input 
func _handle_dash_input():
	if Input.is_action_just_pressed("Dash") and can_dash == true:
		Dash_timer.start()
		is_dashing = true

# repeasts the dash function for a set of time determined by the dash timer 
func _handle_dash_time():
	if Dash_timer.wait_time != Dash_timer.time_left:
		if !Dash_timer.is_stopped() or is_dashing == false:
			_dash()

# sets the dash value
func _dash():
		velocity.x = dash_speed * move_direction

# sets the gravity for the dash to be zero 
func _dash_gravity():
	velocity.y = 0

#applies the dash for the charater
func _handle_dash_movement():
	move_and_slide()
	_handle_dash_time()

# sets dashing to false
func _on_timer_timeout():
	is_dashing = false
	can_dash = false
