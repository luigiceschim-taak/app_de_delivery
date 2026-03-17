public with sharing class EstadoCarrinho extends EstadoPedido {
    public EstadoCarrinho() {

    }

    public override void adicionarProduto(IPedidoAcoes p, Produto produto, Integer quantidade, PoliticaDePreco politica) {
        p.adicionarNovoItem(produto, quantidade, politica);
    }

    public override void removerProduto(IPedidoAcoes p, Produto produto) {
        p.removerItem(produto);
    }

    public override void confirmar(IPedidoAcoes p) {
        p.confirmarPedidoPrivado(new EstadoEmProcessamento());
    }
    public override void cancelar(IPedidoAcoes p){
        p.cancelarPedidoPrivado(new EstadoCancelado());
    }
    

}