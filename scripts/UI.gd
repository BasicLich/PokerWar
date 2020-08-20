extends CanvasLayer

onready var Alertmsg = $Alert

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func send_alert(msg):
	$Alert.text = msg
	$AnimationPlayer.play("DisplayAlert")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
