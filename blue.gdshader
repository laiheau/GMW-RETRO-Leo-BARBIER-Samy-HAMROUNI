shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE : hint_screen_texture, filter_linear_mipmap;

uniform vec3 black_color : source_color = vec3(0.0, 0.114, 0.165);
uniform vec3 blue1_color : source_color = vec3(0.031, 0.333, 0.384);  // Dark Blue
uniform vec3 blue2_color : source_color = vec3(0.0, 0.604, 0.596);  // Medium Blue
uniform vec3 blue3_color : source_color = vec3(0.0, 0.745, 0.569);  // Light Blue

uniform float threshold1 : hint_range(0.0, 1.0) = 0.2;  // Threshold for black
uniform float threshold2 : hint_range(0.0, 1.0) = 0.5;  // Threshold for dark blue
uniform float threshold3 : hint_range(0.0, 1.0) = 0.8;  // Threshold for medium blue

void fragment() {
    // Get the current pixel color from the texture
    vec4 color = texture(SCREEN_TEXTURE, SCREEN_UV);

    // Get the brightness (blue channel)
    float brightness = max(max(color.r, color.g), color.b);

    // Use brightness to assign a color based on the thresholds
    if (brightness < threshold1)
        COLOR.rgb = black_color;
    else if (brightness < threshold2)
        COLOR.rgb = blue1_color; // Dark Blue
    else if (brightness < threshold3)
        COLOR.rgb = blue2_color; // Medium Blue
    else
        COLOR.rgb = blue3_color; // Light Blue

    // Preserve the original alpha (transparency) of the sprite
    COLOR.a = color.a;
}
