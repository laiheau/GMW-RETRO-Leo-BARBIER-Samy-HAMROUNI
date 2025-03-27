extends Label

func _ready():
	text = "score: 0"

func add_score(nbr):
	var score = int(text.get_slice(": ", 1))
	
	text = "score: "+str(score + nbr)
