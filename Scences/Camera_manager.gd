extends Node2D

@onready var Area_1 = $Area2D
@onready var Cam_p_1 = $Area2D/Marker2D

@onready var Area_2 = $Area2D2
@onready var Cam_p_2 = $Area2D2/Marker2D2

@onready var Area_3 = $Area2D3
@onready var Cam_p_3 = $Area2D3/Marker2D

@onready var Area_4 = $Area2D4
@onready var Cam_p_4 = $Area2D4/Marker2D

@onready var Area_5 = $Area2D5
@onready var Cam_p_5 = $Area2D5/Marker2D

@onready var Area_6 = $Area2D6
@onready var Cam_p_6 = $Area2D6/Marker2D

@onready var Area_7 = $Area2D7
@onready var Cam_p_7 = $Area2D7/Marker2D

@onready var Area_8 = $Area2D8
@onready var Cam_p_8 = $Area2D8/Marker2D

@onready var Area_9 = $Area2D9
@onready var Cam_p_9 = $Area2D9/Marker2D 

@onready var Area_10 = $Area2D10
@onready var Cam_p_10 = $Area2D10/Marker2D

@onready var Area_11 = $Area2D11
@onready var Cam_p_11 = $Area2D11/Marker2D

@onready var Area_12 = $Area2D12
@onready var Cam_p_12 =$Area2D12/Marker2D 

@onready var Area_13 = $Area2D13
@onready var Cam_p_13 = $Area2D13/Marker2D

@onready var Area_14 = $Area2D14
@onready var Cam_p_14 = $Area2D14/Marker2D

@onready var Area_15 = $Area2D15
@onready var Cam_p_15 = $Area2D15/Marker2D


@onready var Cams = $Camera2D

# Called when the node enters the scene tree for the first time.
func _ready():
	Cams.global_position.y = Cam_p_1.global_position.y
	Cams.global_position.x = Cam_p_1.global_position.x



func _on_area_2d_2_body_entered(_body):
	Cams.global_position.y = Cam_p_2.global_position.y
	Cams.global_position.x = Cam_p_2.global_position.x

func _on_area_2d_body_entered(_body):
	Cams.global_position.y = Cam_p_1.global_position.y
	Cams.global_position.x = Cam_p_1.global_position.x 

func _on_area_2d_3_body_entered(_body):
	Cams.global_position.y = Cam_p_3.global_position.y
	Cams.global_position.x = Cam_p_3.global_position.x

func _on_area_2d_4_body_entered(_body):
	Cams.global_position.y = Cam_p_4.global_position.y
	Cams.global_position.x = Cam_p_4.global_position.x

func _on_area_2d_5_body_entered(_body):
	Cams.global_position.y = Cam_p_5.global_position.y
	Cams.global_position.x = Cam_p_5.global_position.x

func _on_area_2d_6_body_entered(_body):
	Cams.global_position.y = Cam_p_6.global_position.y
	Cams.global_position.x = Cam_p_6.global_position.x

func _on_area_2d_7_body_entered(_body):
	Cams.global_position.y = Cam_p_7.global_position.y
	Cams.global_position.x = Cam_p_7.global_position.x

func _on_area_2d_8_body_entered(_body):
	Cams.global_position.y = Cam_p_8.global_position.y
	Cams.global_position.x = Cam_p_8.global_position.x

func _on_area_2d_9_body_entered(_body):
	Cams.global_position.y = Cam_p_9.global_position.y
	Cams.global_position.x = Cam_p_9.global_position.x

func _on_area_2d_10_body_entered(_body):
	Cams.global_position.y = Cam_p_10.global_position.y
	Cams.global_position.x = Cam_p_10.global_position.x

func _on_area_2d_11_body_entered(_body):
	Cams.global_position.y = Cam_p_11.global_position.y
	Cams.global_position.x = Cam_p_11.global_position.x

func _on_area_2d_12_body_entered(_body):
	Cams.global_position.y = Cam_p_12.global_position.y
	Cams.global_position.x = Cam_p_12.global_position.x

func _on_area_2d_13_body_entered(_body):
	Cams.global_position.y = Cam_p_13.global_position.y
	Cams.global_position.x = Cam_p_13.global_position.x

func _on_area_2d_14_body_entered(_body):
	Cams.global_position.y = Cam_p_14.global_position.y
	Cams.global_position.x = Cam_p_14.global_position.x

func _on_area_2d_15_body_entered(_body):
	Cams.global_position.y = Cam_p_15.global_position.y
	Cams.global_position.x = Cam_p_15.global_position.x
