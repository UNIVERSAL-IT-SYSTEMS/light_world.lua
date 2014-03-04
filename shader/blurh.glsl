extern vec2 screen = vec2(800.0, 600.0);

vec4 effect(vec4 color, Image texture, vec2 texture_coords, vec2 pixel_coords) {
	vec2 pSize = vec2(1.0 / screen.x, 1.0 / screen.y);
	vec4 col = Texel(texture, texture_coords);
	col = col + Texel(texture, vec2(texture_coords.x, texture_coords.y - pSize.y));
	col = col + Texel(texture, vec2(texture_coords.x, texture_coords.y + pSize.y));
	col = col + Texel(texture, vec2(texture_coords.x, texture_coords.y - pSize.y * 2));
	col = col + Texel(texture, vec2(texture_coords.x, texture_coords.y + pSize.y * 2));
	col = col + Texel(texture, vec2(texture_coords.x, texture_coords.y - pSize.y * 3));
	col = col + Texel(texture, vec2(texture_coords.x, texture_coords.y + pSize.y * 3));
	col = col / 7.0;
	return vec4(col.r, col.g, col.b, 1.0);
}