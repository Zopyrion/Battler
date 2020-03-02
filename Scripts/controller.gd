extends Node2D

var units = []
var anchor = null

func _input(event):

	if event is InputEventMouseButton:


		if(event.is_pressed() and event.button_index == BUTTON_LEFT):
			#var Unit = load("res://Units/Ball.tscn") 
			var Unit = load("res://Units/Group.tscn") 
			var unit = Unit.instance()
			unit.position = get_global_mouse_position()
			unit.init()
			add_child(unit)
			units.append(unit)
		

		elif(event.is_pressed() and event.button_index == BUTTON_RIGHT):
				if anchor != null:
					remove_child(anchor)
				var anchor_scene = load("res://Anchor.tscn") 
				var new_anchor = anchor_scene.instance()
				new_anchor.position = get_global_mouse_position()
				add_child(new_anchor)
				anchor = new_anchor

	elif event is InputEventKey:
		if event.pressed:
			if event.scancode == KEY_SPACE and anchor != null:
				var point = anchor.get_position()
				for unit in units:
					unit.set_destination(point)
					unit.move()

