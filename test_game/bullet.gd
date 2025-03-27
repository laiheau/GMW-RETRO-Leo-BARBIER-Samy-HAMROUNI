extends Area2D

const SPEED = 800
var velocity = Vector2(1, 0) * SPEED
var damage = 5

func _process(delta):
	position += velocity * delta
	if position.x < -100 or position.x > get_viewport_rect().size.x + 100:
		queue_free()
	elif position.y < -100 or position.y > get_viewport_rect().size.y + 100:
		queue_free()


func _on_area_entered(area):
	area.take_dmg(damage)
	self.queue_free()
