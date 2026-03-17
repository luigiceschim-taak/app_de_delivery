public with sharing class EstadoEmProcessamento extends EstadoPedido {
    public EstadoEmProcessamento() {

    }

    public override void cancelar(IPedidoAcoes p){
        p.cancelarPedidoPrivado(new EstadoCancelado());
    }
    public override void marcarComoEntregue(IPedidoAcoes p){
        p.marcarEntregue(new EstadoEntregue());
    }


}