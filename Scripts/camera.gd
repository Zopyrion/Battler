extends Camera2D

var NORMAL_ZOOM = 1
var MAX_ZOOM = 100
var ZOOM_CONST = 0.3

func _ready():
	zoom.x = NORMAL_ZOOM
	zoom.y = NORMAL_ZOOM
	
func _input(event):
	if event is InputEventMouseButton:
		#Wheel Up
		if(event.is_pressed() and event.button_index == BUTTON_WHEEL_UP):
			_zoom_camera(-1)
		# Wheel down
		elif(event.is_pressed() and event.button_index == BUTTON_WHEEL_DOWN):
			_zoom_camera(1)

# Zoom Camera
func _zoom_camera(dir):
	if dir == -1 and zoom.x < NORMAL_ZOOM - MAX_ZOOM:
		return
	elif dir == 1 and zoom.x > NORMAL_ZOOM + MAX_ZOOM:
		return
	zoom += Vector2(ZOOM_CONST, ZOOM_CONST) * dir

