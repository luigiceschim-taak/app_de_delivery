public with sharing class Restaurante {

    String nome{get; private set;}
    String endereco{get; private set;}
    CategoriaRestaurante categoria{get; private set;}
    
    public List<Produto> cardapio{get; private set;}
    
    public Restaurante() {

    }

    public Restaurante(String nome, String endereco, CategoriaRestaurante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = new List<Produto>();
    }
}