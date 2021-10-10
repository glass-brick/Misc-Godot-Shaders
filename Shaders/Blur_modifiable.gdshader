shader_type canvas_item;
render_mode blend_mix;

uniform float max_radius = 40.0;
uniform float x_speed = 1;
uniform float x_offset = 0;
uniform float y_speed = 1;
uniform float y_offset = 0;



void fragment() {
	float radius = max_radius * abs(cos(TIME));
	vec4 col = texture(TEXTURE, UV);
	vec2 ps = TEXTURE_PIXEL_SIZE;

	col += texture(TEXTURE, UV + vec2(0.0, -radius*cos(TIME*y_speed + y_offset)) * ps);
	col += texture(TEXTURE, UV + vec2(0.0, radius*cos(TIME*y_speed + y_offset)) * ps);
	col += texture(TEXTURE, UV + vec2(-radius*cos(TIME*x_speed + x_offset), 0.0) * ps);
	col += texture(TEXTURE, UV + vec2(radius*cos(TIME*x_speed + x_offset), 0.0) * ps);
	col /= 5.0;

	COLOR = col;
}
