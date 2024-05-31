extends TextureRect

var visivel = self.visible


func _on_VisibilityNotifier2D_viewport_entered(_viewport):
	visivel = true


func _on_VisibilityNotifier2D_viewport_exited(_viewport):
	visivel = false
