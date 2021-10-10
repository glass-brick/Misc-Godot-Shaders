shader_type canvas_item;
render_mode blend_mix;

uniform float radius = 5.0;
uniform float speed = 5.0;
uniform vec4 modulate: hint_color;

void fragment() {
	vec2 ps = TEXTURE_PIXEL_SIZE;

	float radius_now = radius * abs(cos(TIME) * speed);
	vec4 shadow = texture(TEXTURE, UV + vec2(-radius_now, -radius_now) * ps);

	shadow += texture(TEXTURE, UV + vec2(-radius_now, 0.0) * ps);
	shadow += texture(TEXTURE, UV + vec2(-radius_now, radius_now) * ps);
	shadow += texture(TEXTURE, UV + vec2(0.0, -radius_now) * ps);
	shadow += texture(TEXTURE, UV + vec2(0.0, radius_now) * ps);
	shadow += texture(TEXTURE, UV + vec2(radius_now, -radius_now) * ps);
	shadow += texture(TEXTURE, UV + vec2(radius_now, 0.0) * ps);
	shadow += texture(TEXTURE, UV + vec2(radius_now, radius_now) * ps);
	shadow /= 0.200;
	shadow *= modulate;

	vec4 col = texture(TEXTURE, UV);
	COLOR = mix(shadow, col, col.a);
}
