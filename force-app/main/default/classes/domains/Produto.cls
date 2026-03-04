public with sharing class Produto {

    public String nome{get; private set;}
    public Dinheiro precoBase{get; private set;}
    private PoliticaDePreco politicaDePreco;


    public Produto(String nome, Dinheiro precoBase, PoliticaDePreco politicaDePreco) {
        this.nome = nome;
        this.politicaDePreco = politicaDePreco;
        this.precoBase = precoBase;
    }
    

    public Dinheiro calcularPreco() {
        return politicaDePreco.calcularPreco(this);
    }
}