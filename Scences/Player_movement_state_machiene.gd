extends "res://Code/State_machiene.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	_add_state("idle")
	_add_state("run")
	_add_state("fall")
	_add_state("jump")
	_add_state("dash")
	call_deferred("_set_state" , states.idle)



func _state_logic(delta):
	if state != states.dash:
		parent._handle_player_movement(delta)
		parent._handle_move_direction()
		parent._handle_sprite_status()
		parent._handle_jump_input()
		parent._handle_dash_input()
	if state == states.dash:
		parent._dash_gravity()
		parent._handle_dash_time()
		parent._handle_dash_movement()
		

func _get_transition(delta):
	match state:
		states.idle:
			if parent.velocity.x != 0:
				return states.run
			if parent.velocity.y != 0:
				if parent.velocity.y > 0:
					return states.fall
				elif parent.velocity.y < 0:
					return states.jump
		states.run:
			if parent.velocity.x == 0:
				if parent.is_on_floor() == true:
					return states.idle
			if parent.velocity.y != 0:
				if parent.velocity.y > 0:
					return states.fall
				elif parent.velocity.y < 0:
					return states.jump
			if parent.is_dashing == true:
				return states.dash
		states.fall:
			if parent.velocity.y == 0:
				if parent.velocity.x == 0:
					if parent.is_on_floor() == true:
						return states.idle
				elif parent.velocity.x != 0:
					return states.run
			if parent.velocity.y < 0:
				return states.jump
			if parent.is_dashing == true:
				return states.dash
		states.jump:
			if parent.velocity.y > 0:
				return states.fall
			if parent.is_dashing == true:
				return states.dash
		states.dash:
			if parent.is_dashing == false:
				if parent.velocity.y != 0:
					if parent.velocity.y > 0:
						return states.fall
				else:
					if parent.velocity.x == 0:
						if parent.is_on_floor() == true:
							return states.idle
					elif parent.velocity.x != 0:
						return states.run

func _enter_state(new_state, old_state):
	parent.State.text = states.keys()[new_state]
	match state:
		states.idle:
			parent.Animations.set("parameters/Dash_state/transition_request", "not_dashing")
			parent.Animations.set("parameters/On_floor/transition_request", "Grounded")
			parent.Animations.set("parameters/Movement/transition_request", "Idle")
		states.run:
			parent.Animations.set("parameters/Dash_state/transition_request", "not_dashing")
			parent.Animations.set("parameters/On_floor/transition_request", "Grounded")
			parent.Animations.set("parameters/Movement/transition_request", "Running")
		states.fall:
			parent.Animations.set("parameters/Dash_state/transition_request", "not_dashing")
			parent.Animations.set("parameters/On_floor/transition_request", "Not_grounded")
		states.jump:
			parent.Animations.set("parameters/Dash_state/transition_request", "not_dashing")
			parent.Animations.set("parameters/On_floor/transition_request", "Not_grounded")
			parent.Animations.set("parameters/Jump/request",  AnimationNodeOneShot.ONE_SHOT_REQUEST_FIRE)
		states.dash:
			parent.Animations.set("parameters/Dash_state/transition_request", "Is_dashing")

func _exit_state(new_state, old_state):
	pass
