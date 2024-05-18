shader_type canvas_item;


uniform float velocidade = 0.2; // A velocidade da animação é uma flutuante que tem o range de 0 à 20
uniform vec2 vetor_de_movimento = vec2(1.0,0.0); // O vetor da direço de movimento do parallax


// o void fragment é uma função que a cada chamada de frame modifica um pixel diferente do canva.
void fragment() {
	COLOR = texture(TEXTURE, UV + (vetor_de_movimento * TIME * velocidade));
}