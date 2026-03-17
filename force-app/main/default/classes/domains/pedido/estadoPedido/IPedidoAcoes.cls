public interface IPedidoAcoes {
    void adicionarNovoItem(Produto produto, Integer quantidade, PoliticaDePreco politicaDePreco);
    void confirmarPedidoPrivado(EstadoPedido estado);
    void cancelarPedidoPrivado(EstadoPedido estado);
    void marcarEntregue(EstadoPedido estado);
    void removerItem(Produto produto);
}