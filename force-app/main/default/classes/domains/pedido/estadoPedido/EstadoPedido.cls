public abstract with sharing class EstadoPedido {
    
    
    public virtual void adicionarProduto(IPedidoAcoes p, Produto produto, Integer quantidade, PoliticaDePreco politica) {
        throw new IllegalArgumentException('Não é possível adicionar produtos no estado ');
    }

    public virtual void removerProduto(IPedidoAcoes p, Produto produto) {
        throw new IllegalArgumentException('Não é possível remover produtos no estado ');
    }

    public virtual void confirmar(IPedidoAcoes p) {
        throw new IllegalArgumentException('Operação de confirmação inválida para o estado ');
    }

    public virtual void cancelar(IPedidoAcoes p) {
        throw new IllegalArgumentException('Operação de confirmação inválida para o estado ');

    }

    public virtual void marcarComoEntregue(IPedidoAcoes p) {
        throw new IllegalArgumentException('Operação de confirmação inválida para o estado ');
    }
}
