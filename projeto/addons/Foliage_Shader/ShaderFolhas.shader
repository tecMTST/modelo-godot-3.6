shader_type canvas_item;

// todas as variaveis que são consideradas uniformes são o mesmo que uma export do gdscript
uniform float intensidade_do_x = 3.0; // Primeiro ele define uma variavel uniforme float de intensidade do eixo X
uniform float intensidade_do_y = 0.5; // Segundo ele define uma variavel uniforme float de intensidade do eixo Y
uniform float velocidade : hint_range(0, 20) = 2.0; // A velocidade da animação é uma flutuante que tem o range de 0 à 20
uniform float frequencia_de_onda : hint_range(0, 100) = 20; // A frequencia de onda é uma flutuante que tem o range de 0 à 100
// ela vai ser responsavel pela distorção dos pixeis

// o void fragment é uma função que a cada chamada de frame modifica um pixel diferente do canva.
void fragment() {
	vec2 uv_original = vec2(UV.x, UV.y); // A variável guarda as coordenadas originais dos uvs do canvas
	
	vec2 vecToBottom = vec2(1, 1) - UV.y; 
	float distToBottom = length(vecToBottom);
	
	float velocidade_final = TIME * (velocidade / 4.0);
	
	float tempo_decorrido = (cos(velocidade_final) * cos(velocidade_final * 4.0) * cos(velocidade_final * 2.0))/(200.0);
	float tempo_decorrido_2 = (cos(velocidade_final) * cos(velocidade_final * 6.0) * cos(velocidade_final * 2.0))/(200.0);
	
	float onda_x = (cos(uv_original.x * 100.0)/1000.0);
	float onda_longitudinal_x = cos(TIME + (uv_original.x * frequencia_de_onda))/200.0;
	
	float onda_y = (cos(uv_original.y * 99000.0)/90000.0);
	
	float novo_x = uv_original.x + tempo_decorrido * (distToBottom * intensidade_do_x) + onda_x + (onda_longitudinal_x);
	float novo_y = uv_original.y + tempo_decorrido_2 * (distToBottom * intensidade_do_y);
	
	vec2 nova_uv1 = vec2(novo_x, novo_y);
	vec4 textura_nova = texture(TEXTURE, nova_uv1);
	
	if(textura_nova.rgb != vec3(1,1,1)){
		COLOR = textura_nova;
	}
}