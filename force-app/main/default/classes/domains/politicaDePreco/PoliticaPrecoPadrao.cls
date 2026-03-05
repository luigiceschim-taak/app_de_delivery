public with sharing class PoliticaPrecoPadrao implements PoliticaDePreco {
    public PoliticaPrecoPadrao() {

    }

    public Dinheiro calcularPreco(Produto produto) {
        return new Dinheiro(produto.precoBase.valor);
    }
}