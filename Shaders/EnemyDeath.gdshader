shader_type canvas_item;

uniform sampler2D dissolve_texture : hint_albedo;
uniform float speed;

void fragment(){
	float effect_percentage = abs(cos(TIME)*speed);
    vec4 main_texture = texture(TEXTURE, UV);
    vec4 noise_texture = texture(dissolve_texture, UV);
    main_texture.a *= min(floor(effect_percentage *  abs(UV.y*UV.y+1.0) + noise_texture.y) , 1.0);
    COLOR = main_texture;
}