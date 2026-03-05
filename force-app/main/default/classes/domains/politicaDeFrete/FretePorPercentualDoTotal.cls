public with sharing class FretePorPercentualDoTotal implements PoliticaDeFrete {
    public FretePorPercentualDoTotal() {

    }


    public Dinheiro calcularFrete(Pedido pedido){
        return new Dinheiro(pedido.total.valor * 0.05);
    }
}