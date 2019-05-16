shader_type canvas_item;

uniform float fill : hint_range(0., 1.) = 0.5;

void fragment () {
	float mask = texture(TEXTURE, UV).r;
	vec3 black = vec3(0.);
	COLOR = vec4(black, step(mask, fill));
}