tool
extends CanvasLayer

###########################################################
# Transition List
###########################################################
var transition_list : Array = [
	"transition-hbars.png",
	"transition-vbars.png",
	"transition-mechadoor.png",
	"transition-noise.png",
	"transition-motion.png",
	"transition-motion-pixel.png",
	"transition-swirl.png",
	"transition-pixel-swirl.png",
	"transition-pixel.png",
	"transition-slashes.png",
	"transition-stripes.png",
	"transition-grid.png"
]

enum Transitions {
	bars_x,
	bars_y,
	mecha_door,
	noise,
	motion,
	motion_pixel,
	swirl,
	pixel_swirl_2,
	pixel_swirl,
	slashes,
	stripes,
	grid
}

###########################################################
# Attributes and Logic
###########################################################
export(Transitions) var mask : int = 0 setget _set_mask
export(float, 0.0, 1.0) var fill : float = 0 setget _set_fill
export(float, 0.0, 3.0, 0.1) var duration : float = 1 setget _set_duration

var input_lock : bool = false

onready var tex_rect : TextureRect = $TextureRect

###########################################################
# Every Frame
###########################################################
func _ready():
	self.mask = mask
	self.fill = fill
	self.duration = duration

func _process(delta):
	if Engine.editor_hint:
		print("hint")
		set_process(false)
	else:
		if Input.is_action_pressed("ui_accept"):
			tex_rect.hide_screen()
		elif Input.is_action_pressed("ui_cancel"):
			tex_rect.show_screen()

###########################################################
# Set Get
###########################################################
func _set_mask(transition_mask:int):
	var new_mask : Texture = load(
		"res://scenes/Transition/transition-imgs/%s" %
		transition_list[transition_mask])
	if new_mask:
		mask = transition_mask
		if Engine.editor_hint:
			$TextureRect.texture = new_mask
		elif tex_rect:
			tex_rect.texture = new_mask

func _set_fill(val:float):
	fill = val
	if Engine.editor_hint:
		$TextureRect.fill = val
	elif tex_rect:
		tex_rect.fill = val

func _set_duration(val:float):
	duration = val
	if Engine.editor_hint:
		$TextureRect.duration = val
	elif tex_rect:
		tex_rect.duration = val