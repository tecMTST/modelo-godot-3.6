shader_type canvas_item;

uniform bool ativo; // variavel de bool (autoexplicativo)
uniform vec4 cor_flash : hint_color; // cor utilizada para piscar o flash (por padrão vai ser preto)
uniform float velocidade_piscar; // velocidade de piscadas

void fragment(){
	vec4 textura = texture(TEXTURE, UV); // cria uma variavel que pega o UV do sprite
    if (ativo) { // se o bool for ativado irá fazer isso
        float tempo = TIME * velocidade_piscar; // tempo de piscadas * o delta time
        float intensidade = abs(sin(tempo)); // variavel que faz uma absoluta de um sen0 do tempo para transformar o delta em um numero absoluto
        vec4 cor = mix(textura, cor_flash, intensidade); // variavel que faz um mix de tudo
        COLOR = vec4(cor.rgb, textura.a); // faz com que o color vire o mix com a textura
    } else { // se o bool for falso ele irá apenas dar display na textura sem efeito
        COLOR = textura;
    }
}