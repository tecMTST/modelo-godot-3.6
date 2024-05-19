extends Label


func _physics_process(delta):
	var fps = Engine.get_frames_per_second()
	
	self.text = 'FPS: ' + String(fps)
