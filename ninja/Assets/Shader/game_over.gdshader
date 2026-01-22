shader_type canvas_item;

float random(vec2 position){
    return fract(sin(dot(position, vec2(12.9898, 78.233))) * 43758.5453);
}

void fragment() {
    float noise = random(UV+ TIME);
    vec3 color = vec3(noise);
    COLOR = vec4(color, 9.0);
}
