public with sharing class PoliticaPrecoComDescontoPercentual implements PoliticaDePreco {
    public PoliticaPrecoComDescontoPercentual() {

    }

    public Dinheiro calcularPreco(Produto produto) {
        Decimal valorComDesconto = produto.precoBase.valor * (1 - 10 / 100);
        return new Dinheiro(valorComDesconto);
    }

}