shader_type canvas_item;
render_mode blend_premul_alpha;

// This shader only works properly with premultiplied alpha blend mode.
uniform float aura_width = 2.0;
uniform float speed = 0.0;
uniform vec4 aura_color: hint_color;

void fragment() {
	float aura_now = aura_width * abs(cos(TIME) * speed);
	vec4 col = texture(TEXTURE, UV);
	vec2 ps = TEXTURE_PIXEL_SIZE;
	float a;
	float maxa = col.a;
	float mina = col.a;

	a = texture(TEXTURE, UV + vec2(0.0, -aura_now) * ps).a;
	maxa = max(a, maxa);
	mina = min(a, mina);

	a = texture(TEXTURE, UV + vec2(0.0, aura_now) * ps).a;
	maxa = max(a, maxa);
	mina = min(a, mina);

	a = texture(TEXTURE, UV + vec2(-aura_now, 0.0) * ps).a;
	maxa = max(a, maxa);
	mina = min(a, mina);

	a = texture(TEXTURE, UV + vec2(aura_now, 0.0) * ps).a;
	maxa = max(a, maxa);
	mina = min(a, mina);

	col.rgb *= col.a;

	COLOR = col;
	COLOR.rgb += aura_color.rgb * (maxa - mina);
}
