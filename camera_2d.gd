extends Camera2D

var pull = false
var mousePos
var mmPos
var jumpFrame = 0.5
var currentPos
var dragging = false
var drag_start


func _input(event):
	if event is InputEventMouseButton:
		if event.is_action_pressed("ui_mid_mouse_button"):
			dragging = true
			drag_start = to_local(event.position)
		elif event.is_action_released("ui_mid_mouse_button"):
			dragging = false
	
	if event is InputEventMouseMotion:
		if dragging:
			var new_postion = to_local(event.position)
			var relative = new_postion - drag_start
			offset -= relative
			drag_start = new_postion
	if event.is_action_pressed("ui_scroll_up"):
		if zoom.x >=0.8 and zoom.y >= 0.8:
			zoom.x -= 0.2
			zoom.y -= 0.2
	if event.is_action_pressed("ui_scroll_down"):
		if zoom.x <=2 and zoom.y <= 2:
			zoom.x += 0.2
			zoom.y += 0.2		
# func _process(delta):
# 	mmPos = get_global_mouse_position()
# 	if Input.is_action_just_released("ui_scroll_up"):
# 		if zoom.x >=0.8 and zoom.y >= 0.8:
# 			zoom.x -= 0.2
# 			zoom.y -= 0.2
# 	if Input.is_action_just_released("ui_scroll_down"):
# 		if zoom.x <=2 and zoom.y <= 2:
# 			zoom.x += 0.2
# 			zoom.y += 0.2
# 	if Input.is_action_just_pressed("ui_mid_mouse_button"):
# 		pull = true
# 		mousePos = get_global_mouse_position()
# 		print(mousePos)
# 	if Input.is_action_just_released("ui_mid_mouse_button"):
# 		pull = false
		#get_tree().quit()
	#print(delta)
	# jumpFrame -= delta
	# if jumpFrame < 0:
	# 	jumpFrame = 1
	# 	return
		
	
	# if pull:
	# 	jumpFrame -= delta
	# 	if jumpFrame < 0:
	# 		jumpFrame = 0.1
			
	# # 	return
	# 		currentPos = get_global_mouse_position()
	# 	# if mousePos.distance_to(currentPos) < 10:
	# 	# #pull = false
	# 	# 	return	
	# 	#if currentPos.distance_to(mousePos) > 10:
	# 		offset -= (currentPos - mousePos).floor()

	# 		mousePos.x = currentPos.x
	# 		mousePos.y = currentPos.y
			
	# %DebugText.text = "offset: " + str(offset) + " mousePos: " + str(mousePos) + " currentPos: " + str(currentPos) +" mmPos" + str(mmPos)
	
	# print("offset")		

	# print("		mousePos")
	# print(mousePos)
	# print("		currentPos")
	# print(currentPos)
