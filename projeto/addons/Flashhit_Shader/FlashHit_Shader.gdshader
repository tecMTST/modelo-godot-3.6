shader_type canvas_item;

uniform bool ativo;
uniform vec4 cor_flash : hint_color;
uniform float velocidade_piscar;

void fragment(){
	vec4 textura = texture(TEXTURE, UV);
    if (ativo) {
        float tempo = TIME * velocidade_piscar;
        float intensidade = abs(sin(tempo));
        vec4 cor = mix(textura, cor_flash, intensidade);
        COLOR = vec4(cor.rgb, textura.a);
    } else {
        COLOR = textura;
    }
}