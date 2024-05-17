shader_type canvas_item;


uniform vec4 cor_do_highlight : hint_color; // A cor que aparece quando o highlight acontece por padrão ta preto
uniform float piscadas : hint_range(0.0, 25.0) = 0.35; // variavel para controlar a quantidade de piscadas a cada chamada
uniform float velocidades_highlights : hint_range(0.0, 25.0) = 6.0; // velocidade de cada piscada
uniform float tamanho_highlights : hint_range(0.0, 50.0) = 15.0; // o tamanho de cara highlight

void fragment( )
{
	vec4 cor_input = texture(TEXTURE, UV);
	float duracao = 0.001 * piscadas * tamanho_highlights / 2.0;
	
	// pode-se mudar + ou - para os UV
	// para controlar a direção para onde o highlight começa e termina
	// ex: -UV.x - UV.y faz o highlight ir do canto
	// Superior direita para a Inferior esquerda
	float valor = floor(sin(piscadas * ((UV.x - UV.y) + TIME * velocidades_highlights)) + duracao);
	
	// uma variavel para controlar e diferenciar o highlight do cor_input
	float highlight = valor > 0.5? 1.0: 0.0;
	vec3 nova_cor = cor_input.rgb * (1.0 - highlight) + cor_do_highlight.rgb * highlight;
	COLOR = vec4(nova_cor, cor_input.a);
}