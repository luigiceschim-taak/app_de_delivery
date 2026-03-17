public with sharing class PoliticaPrecoComDescontoPercentual implements PoliticaDePreco {
    public PoliticaPrecoComDescontoPercentual() {

    }

    public Dinheiro calcularPreco(Produto produto) {
        Decimal valorComDesconto = produto.precoBase.valor * 0.8; // 20% de desconto
        return new Dinheiro(valorComDesconto);
    }

}