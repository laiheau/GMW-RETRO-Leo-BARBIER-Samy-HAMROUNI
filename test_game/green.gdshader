shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec3 black_color : source_color = vec3(0.0, 0.165, 0.114);
uniform vec3 green1_color : source_color = vec3(0.0, 0.28, 0.15);  // Dark Green
uniform vec3 green2_color : source_color = vec3(0.0, 0.6, 0.3);  // Medium Green
uniform vec3 green3_color : source_color = vec3(0.0, 1.0, 0.4);  // Light Green

uniform float threshold1 : hint_range(0.0, 1.0) = 0.2;  // Threshold for black
uniform float threshold2 : hint_range(0.0, 1.0) = 0.5;  // Threshold for dark green
uniform float threshold3 : hint_range(0.0, 1.0) = 0.8;  // Threshold for medium green

void fragment() {
    // Get the current pixel color from the texture
    vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);

    // Get the brightness (green channel)
    float brightness = max(max(color.r, color.g), color.b);

    // Use brightness to assign a color based on the thresholds
    if (brightness < threshold1)
        COLOR.rgb = black_color;
    else if (brightness < threshold2)
        COLOR.rgb = green1_color; // Dark Green
    else if (brightness < threshold3)
        COLOR.rgb = green2_color; // Medium Green
    else
        COLOR.rgb = green3_color; // Light Green

    // Preserve the original alpha (transparency) of the sprite
    COLOR.a = color.a;
}
