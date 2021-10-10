shader_type canvas_item;

render_mode blend_mix;
uniform float fattyness = 2.0;

void fragment() {
	float fat_now = fattyness * cos(TIME);
	fat_now = fat_now > 0.0 ? fat_now : -fat_now;
	fat_now+=0.5;
	vec2 ruv = UV - vec2(0.5, 0.5);
	vec2 dir = normalize(ruv);
	float len = length(ruv);

	len = pow(len * 2.0, fat_now ) * 0.5;
	ruv = len * dir ;

	vec4 col = texture(TEXTURE, ruv + vec2(0.5, 0.5));

	COLOR = col;
}
