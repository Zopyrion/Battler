extends RigidBody2D

var TYPE = "GROUP"

var stopping_distance = 100
var speed = 0
var _timer = null
var destination = null
var reached = false

var balls = []

func _ready():
	randomize()
	self.set_linear_velocity(Vector2(0, 0))

	
func init():
	speed = randi() % 200 + 180
	
	self.set_rotation(40)
	
	var Ball = load("res://Units/Ball.tscn")

	for i in range(-3, 3):
		for j in range(-2, 2):
			var new_ball = Ball.instance()
			new_ball.position.x = i * 100
			new_ball.position.y = j * 100
			new_ball.init()
			add_child(new_ball)
			balls.append(new_ball)

	
	
func set_destination(destination):
	self.destination = destination
	#for ball in self.balls:
	#	ball.set_destination(destination)

	
func move():
	self.reached = false
	var vector = (self.destination - self.get_position()).normalized()
	self.set_linear_velocity(vector * self.speed)
	for ball in self.balls:
		ball.set_linear_velocity(vector * self.speed)
		#ball.move()
	
func stop():
	#self.set_mode(1)
	self.set_linear_velocity(Vector2(0, 0))