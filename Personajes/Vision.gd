extends RayCast3D

@onready var label : Label = get_node("Label")
@onready var crosshair : TextureRect = get_node("../../Puntero")

var crosshair_dot : Texture = preload("res://Recursos/Interfaz/crosshair_dot.png")
var crosshair_hand : Texture = preload("res://Recursos/Interfaz/hand.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	add_exception(owner)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if is_colliding():
		var detected = get_collider()
		print(detected.class_name)
		if detected is Vela:
			crosshair.texture = crosshair_hand
			crosshair.size.x = 20
			crosshair.size.y = 20
			crosshair.set_anchors_preset(Control.PRESET_CENTER)
			label.text = "Pulsa [E] para recoger la vela"
			if Input.is_action_just_pressed("Interactuar"):
				detected.pick_up()
				crosshair.texture = crosshair_dot
				crosshair.size.x = 6
				crosshair.size.y = 6
				crosshair.set_anchors_preset(Control.PRESET_CENTER)
	else:
		label.text = ""
		crosshair.texture = crosshair_dot
		crosshair.size.x = 6
		crosshair.size.y = 6
		crosshair.set_anchors_preset(Control.PRESET_CENTER)
