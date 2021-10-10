shader_type canvas_item;
render_mode blend_premul_alpha;

uniform float max_radius = 5.0;
uniform float max_amount = 0.25;
uniform float radius_speed = 0;
uniform float amount_speed = 1;

void fragment() {
	float radius = max_radius * abs(cos(TIME * radius_speed));
	float amount = max_amount * abs(cos(TIME * amount_speed));
	float r = radius;
	vec2 ps = TEXTURE_PIXEL_SIZE;
	vec4 col = texture(TEXTURE, UV);
	vec4 glow = col;

	glow += texture(TEXTURE, UV + vec2(-r, -r) * ps);
	glow += texture(TEXTURE, UV + vec2(-r, 0.0) * ps);
	glow += texture(TEXTURE, UV + vec2(-r, r) * ps);
	glow += texture(TEXTURE, UV + vec2(0.0, -r) * ps);
	glow += texture(TEXTURE, UV + vec2(0.0, r) * ps);
	glow += texture(TEXTURE, UV + vec2(r, -r) * ps);
	glow += texture(TEXTURE, UV + vec2(r, 0.0) * ps);
	glow += texture(TEXTURE, UV + vec2(r, r) * ps);

	r *= 2.0;
	glow += texture(TEXTURE, UV + vec2(-r, -r) * ps);
	glow += texture(TEXTURE, UV + vec2(-r, 0.0) * ps);
	glow += texture(TEXTURE, UV + vec2(-r, r) * ps);
	glow += texture(TEXTURE, UV + vec2(0.0, -r) * ps);
	glow += texture(TEXTURE, UV + vec2(0.0, r) * ps);
	glow += texture(TEXTURE, UV + vec2(r, -r) * ps);
	glow += texture(TEXTURE, UV + vec2(r, 0.0) * ps);
	glow += texture(TEXTURE, UV + vec2(r, r) * ps);

	glow /= 17.0;
	glow *= amount;
	col.rgb *= col.a;

	COLOR = glow + col;
}
