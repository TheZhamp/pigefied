//SHADERTOY PORT FIX
#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main
//****MAKE SURE TO remove the parameters from mainImage.
//SHADERTOY PORT FIX

/*
	Transverse Chromatic Aberration

	Based on https://github.com/FlexMonkey/Filterpedia/blob/7a0d4a7070894eb77b9d1831f689f9d8765c12ca/Filterpedia/customFilters/TransverseChromaticAberration.swift

	Simon Gladman | http://flexmonkey.blogspot.co.uk | September 2017
*/

int sampleCount = 50;
float blur = 0.25; 
float falloff = 3.0; 

// use iChannel0 for video, iChannel1 for test grid
#define INPUT iChannel0

void main()
{
    vec2 destCoord = fragCoord.xy / iResolution.xy;

    vec2 direction = normalize(destCoord - 0.5); 
    vec2 velocity = direction * blur * pow(length(destCoord - 0.5), falloff);
	float inverseSampleCount = 1.0 / float(sampleCount); 
    
    mat3x2 increments = mat3x2(velocity * 1.0 * inverseSampleCount,
                               velocity * 2.0 * inverseSampleCount,
                               velocity * 4.0 * inverseSampleCount);

    vec3 accumulator = vec3(0);
    mat3x2 offsets = mat3x2(0); 
    
    for (int i = 0; i < sampleCount; i++) {
        accumulator.r += texture(INPUT, destCoord + offsets[0]).r; 
        accumulator.g += texture(INPUT, destCoord + offsets[1]).g; 
        accumulator.b += texture(INPUT, destCoord + offsets[2]).b; 
        
        offsets -= increments;
    }

	fragColor = vec4(accumulator / float(sampleCount), 1.0);
}