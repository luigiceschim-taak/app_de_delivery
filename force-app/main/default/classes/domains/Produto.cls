public with sharing class Produto {

    public String nome{get; private set;}
    public Decimal preco{get; private set;}
    
    public Produto() {

    }

    public Produto(String nome, Decimal preco) {
        this.nome = nome;
        this.preco = preco;
    }
}