public with sharing class Produto {

    public String nome{get; private set;}
    public Dinheiro precoBase{get; private set;}
    private PoliticaDePreco politicaDePreco;


    public Produto(String nome, Dinheiro precoBase) {
        this.nome = nome;
        this.politicaDePreco = new PoliticaPrecoPadrao();
        this.precoBase = precoBase;
    }
    

    public Dinheiro calcularPrecoFinal() {
        return politicaDePreco.calcularPreco(this);
    }
}