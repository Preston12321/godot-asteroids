tool
extends CanvasLayer

const star_scene = preload("res://Stages/Star.tscn")
const star_count = 30
var stars = []

func _ready():
	# Seed random number generator with current time
	randomize()
	
	# Populate background with randomly-placed stars
	for i in range(0, star_count):
		# Instantiate Star scene and add it as a child node
		var star = star_scene.instance()
		stars.push_back(star)
		add_child(star)
		
		# Generate random (x,y) position on-screen
		var size = get_viewport().size
		var x = rand_range(0, size.x)
		var y = rand_range(0, size.y)
		
		# Move new Star node to generated coordinates
		star.position = Vector2(x, y)
