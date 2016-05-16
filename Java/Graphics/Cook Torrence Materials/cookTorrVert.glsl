/* 
Author: Wilford Engel
Date:  12/2/2016
SRN:  130190747
Advanced Graphics and Animation Coursework Assignment One
*/
/* Modified shader from Gamingfreedom.org, (2016). [online] Available at: http://www.gamingfreedom.org/content/21/14-cook-torrance.pdf [Accessed 7 Feb. 2016].*/

#define PROCESSING_LIGHT_SHADER
uniform vec3 ambient;
uniform vec3 Kd; // surface diffuse color
uniform vec3 Ks; // surface specular color: equal to R_F(0)
varying float m; // material roughness (average slope of microfacets)
uniform float s; // percentage of incoming light which is specularly reflected
uniform vec3 lightPower;
varying vec4 vertColor;

uniform int lightCount;
uniform vec4 lightPosition[8];

uniform mat4 transform;
attribute vec4 vertex;

uniform mat3 normalMatrix;
attribute vec3 normal;

uniform mat4 modelView;
attribute vec4 position;

varying vec3 transformedNormal;
varying vec3 pointPosition;

#define PI 3.14159265

float G(float NdotH, float NdotV, float VdotH, float NdotL)
{
    float G1 = 2.0 * NdotH * NdotV / VdotH;
    float G2 = 2.0 * NdotH * NdotL / VdotH;
    return min( 1.0, min( G1, G2 ));
}

vec3 R_F(float VdotH) {
    return Ks + (1.0 - Ks)*pow(1.0-VdotH, 5.0);
}

float Beckmann(float NdotH){
    float A = 1.0 / (pow(m,2.0)+pow(NdotH,4.0)*PI);
    float B = exp( - pow( tan(acos(NdotH)) , 2.0) / pow(m,2.0));
    return A*B;
}
            
void main()
{
    m = 1 - s;
    vertColor = vec4(0.0, 0.0, 0.0, 1.0);
	gl_Position = transform*vertex;
	transformedNormal = normalize(normalMatrix * normal);
    pointPosition = (modelView * position).xyz;

    for (int i = 0; i < lightCount; i++) {
	    
	    vec3 lightVector = lightPosition[i].xyz - pointPosition;

	    vec3  n = transformedNormal;
	    vec3  v = -pointPosition;
	    vec3  l = lightVector;
	    vec3  h = v+l;

	    vec3 specular = vec3(0.0, 0.0, 0.0);           
	    float  NdotH = max(0.0, dot( n, h ));
	    float  VdotH = max(0.0, dot( v, h ));
	    float  NdotV = max(0.0, dot( n, v ));
	    float  NdotL = max(0.0, dot( n, l ));
	    if (NdotL > 0.0 && NdotV > 0.0) 
	    {
	        specular = (Beckmann(NdotH) * G(NdotH, NdotV, VdotH, NdotL) * R_F(VdotH)) / ( NdotL* NdotV);
	    }

	    vec3 beta = lightPower / ( 4.0  * PI * pow( length(lightVector),2.0) );
	    vertColor += vec4(beta * NdotL * ((1.0-s)*Kd + s*specular) + ambient*Kd, 1.0);
	}
}