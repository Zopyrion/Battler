extends RigidBody2D

var TYPE = "BALL"

var stopping_distance = 100
var speed = 0
var _timer = null
var destination = null
var reached = false


func _ready():
	randomize()
	self.set_linear_velocity(Vector2(0, 0))
	
	_timer = Timer.new()
	add_child(_timer)
	_timer.connect("timeout", self, "_on_Timer_timeout")
	_timer.set_wait_time(1.0)
	_timer.set_one_shot(false)
	_timer.start()
	
	set_contact_monitor(true)
	connect("body_entered", self, "_on_Player_body_entered")
	
	#self.set_bounce(100)
	
	
func init():
	#speed = randi() % 200 + 180
	self.speed = 150
	
func set_destination(destination):
	self.destination = destination
	
func move():
	self.reached = false
	var vector = (self.destination - self.get_position()).normalized()
	self.set_linear_velocity(vector * self.speed)
	
func stop():
	#self.set_mode(1)
	self.set_linear_velocity(Vector2(0, 0))

func adjust():
	pass
	#var vector = (self.destination - self.get_position()).normalized()
	#self.set_linear_velocity(vector * 20)

func _on_Player_body_entered(body):
	if reached and body.TYPE == "BALL":
		body.stop()
	
func _on_Timer_timeout():
	if self.destination != null:
		if abs(self.get_position().x - self.destination.x) < self.stopping_distance and abs(self.get_position().y - self.destination.y) < self.stopping_distance:
			self.reached = true
			self.stop()
		if reached:
			self.adjust()
			self.stop()


		
