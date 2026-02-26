public with sharing class Produto {

    String nome{get; private set;}
    Decimal preco{get; private set;}
    
    public Produto() {

    }

    public Produto(String nome, Decimal preco) {
        this.nome = nome;
        this.preco = preco;
    }
}