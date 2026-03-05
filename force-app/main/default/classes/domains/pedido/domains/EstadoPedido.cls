public abstract with sharing class EstadoPedido {
    public EstadoPedido() {

    }

    public abstract void adicionarProduto(Pedido p);
    public abstract void removerProduto(Pedido p);
    public abstract void confirmar(Pedido p);
    public abstract void cancelar(Pedido p);
    public abstract void marcarComoEntregue(Pedido p);

    

}