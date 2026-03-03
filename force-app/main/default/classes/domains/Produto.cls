public with sharing class Produto {

    public String nome{get; private set;}
    public Dinheiro preco{get; private set;}
    private PoliticaDePreco politicaDePreco;


    public Produto(String nome, Dinheiro preco, PoliticaDePreco politicaDePreco) {
        this.nome = nome;
        this.politicaDePreco = politicaDePreco;
        this.preco = politicaDePreco.calcularPreco(this);
    }
    
}