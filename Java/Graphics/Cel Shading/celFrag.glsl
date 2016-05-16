// Modified from the example at https://processing.org/tutorials/pshader ToonFrag.glsl
#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

#define PROCESSING_COLORLIGHT_SHADER

uniform float fraction;
// uniform float OutlineThickness;

uniform vec3 colors1, colors2, colors3;

varying vec4 vertColor;
varying vec3 vertNormal;
varying vec3 vertLightDir;
varying vec3 vertexCamera;

// varying vec3 normalPass;
uniform vec4 lightPosition;
// varying vec3 positionPass;

void main() {  
  float intensity;
  vec4 color;
  intensity = max(0.0, dot(vertLightDir, vertNormal));

  if (intensity > pow(0.95, fraction)) {
    // color = vec4(vec3(1.0), 1.0);
    color = vec4(colors1, 1.0);
  } else if (intensity > pow(0.5, fraction)) {
    // color = vec4(vec3(0.6), 1.0);
    color = vec4(colors2, 1.0);
  } else if (intensity > pow(0.25, fraction)) {
    // color = vec4(vec3(0.4), 1.0);
    color = vec4(colors3, 1.0);
  } else  if (intensity < 0.1) {
    color = vec4(vec3(0.0), 1.0);
  }
  	else {
  		color = vec4(vec3(0.2), 1.0);
  	}

  // float outlineThickness = 0.9;

   //Calculate Outlines http://pastebin.com/qAZXPEtY
  // float outlineStrength = clamp( ((dot(vertNormal, normalize(vertexCamera) ) - OutlineThickness) * 1000 ), 0.0, 1.0);

  // outlines https://en.wikibooks.org/wiki/GLSL_Programming/Unity/Toon_Shading#Outlines
  // if (dot(normalize(vertNormal), normalize(vertexCamera)) 
  //              < mix(0.7, 0.3, 
  //              max(0.0, dot(vertNormal, vertLightDir))))
  //   {
  //      // fragmentColor = 
  //      //    vec3(_LightColor0) * vec3(_OutlineColor); 
  //      gl_FragColor = vec4(0.0,0.0,0.0,1.0);
  //   }

    // outlines - book
    if (abs(dot(normalize(vertNormal), normalize(vertexCamera))) < 0.01) {
      gl_FragColor = vec4(0.0,0.0,0.0,1.0);
    }

  else {
    gl_FragColor = color * vertColor;  
  } 
}