extends CanvasLayer

# Declare the ShaderMaterial variable with the correct type hint
var shader_material: ShaderMaterial

func _ready():
	# Create the ShaderMaterial and Shader
	shader_material = ShaderMaterial.new()
	var shader = Shader.new()
	
	# Load the shader code (use the code from earlier)
	shader.code = """
	shader_type canvas_item;

	uniform vec3 green1 = vec3(0.0, 0.2, 0.0); // Dark Green (#005000)
	uniform vec3 green2 = vec3(0.0, 0.6, 0.0); // Medium Green (#00A000)
	uniform vec3 green3 = vec3(0.0, 1.0, 0.0); // Light Green (#00FF00)

	void fragment() {
		vec4 color = texture(TEXTURE, FRAGCOORD.xy / SCREEN_PIXEL_SIZE);

		// Convert the color to grayscale (luminance)
		float brightness = dot(color.rgb, vec3(0.2989, 0.5870, 0.1140));

		// Choose the nearest color from the green palette based on brightness
		if (brightness < 0.2)
			COLOR.rgb = green1; // Dark Green
		else if (brightness < 0.4)
			COLOR.rgb = green2; // Medium Green
		else
			COLOR.rgb = green3; // Light Green

		COLOR.a = color.a; // Preserve transparency
	}
	"""
	
	# Set the Shader on the ShaderMaterial
	shader_material.shader = shader
	
	# Create and add the ColorRect to the CanvasLayer
	var color_rect = ColorRect.new()
	color_rect.material = shader_material
	color_rect.rect_size = get_viewport().size
	add_child(color_rect)
