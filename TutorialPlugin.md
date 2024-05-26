# Tutorial de Plugin

### Criação de Plugins - Godot 3.6

1. **Acessar a configurações do Godot**
![step1](https://github.com/tecMTST/modelo-godot-3.6/assets/20847481/74c0a634-32dd-4716-9791-1ba766f64643)

2. **Ir ate a aba de Plugins e clicar em Create**
   
![step2](https://github.com/tecMTST/modelo-godot-3.6/assets/20847481/38845616-ef41-4ce3-b479-904ea9e257a8)

3. **Preenche os seguinte dados na janela de criação de plugin**
   
![step3](https://github.com/tecMTST/modelo-godot-3.6/assets/20847481/a167cf8c-0a3b-476e-925b-7636b4e65248)

   * O nome do plugin
   * A pasta que ficará dentro da pasta addons
   * A descrição do plugin
   * O autor
   * A versão do plugin
   * A linguagem, pode manter GDScript
   * E o nome do script, por padrão é recomendado manter 'plugin.gd', não resultará em confllito com outros plugins
   * Por fim clicar em 'Create'
4. **Neste ponto será criado a subpasta e o script 'plugin.gd'**
   
![step4](https://github.com/tecMTST/modelo-godot-3.6/assets/20847481/351d5bc9-3064-44c5-aea7-dd111935f342)

5. **Agora podemos adicionar na mesma pasta o script do novo plugin**
   * Neste exemplo utilizarei o script do controle de faixas 2D
   * Podemos opcionalmente adicionar um ícone para o node do plugin.
   * Ja no script:
   * Adicionaremos no método '_enter_tree' os dados para carregar o novo plugin:
     * `add_custom_type("Faixa2D", "Node2D",  preload("ControleFaixa2D.gd"), preload("icons/Faixa2D.svg"))`
   * Ja no método '_exit_tree', adicionaremos a remoção do script
     * `remove_custom_type("Faixa2D")`
   * O código completo fica assim:
    ```Python
    tool
    extends EditorPlugin

    func _enter_tree():
        add_custom_type("Faixa2D", "Node2D",  preload("ControleFaixa2D.gd"), preload("icons/Faixa2D.svg"))

    func _exit_tree():
        remove_custom_type("Faixa2D")
    ```

  
![step5](https://github.com/tecMTST/modelo-godot-3.6/assets/20847481/11c13bca-d47a-48fa-9423-2adce9c493de)



4. **Se ainda não estiver ativado, basta voltar nas configurações de plugin e ativar o novo plugin**
 
![step6](https://github.com/tecMTST/modelo-godot-3.6/assets/20847481/4d7c5967-5519-49c5-84af-db7e430d3973)


5. **Com isso o plugin deve ficar disponível para adição na tela de criação de nodes**
    
![step7](https://github.com/tecMTST/modelo-godot-3.6/assets/20847481/a1bb6f38-a5ef-47b0-98ad-29124599eb88)
