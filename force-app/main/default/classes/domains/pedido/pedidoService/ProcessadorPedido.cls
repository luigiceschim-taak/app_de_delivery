public with sharing class ProcessadorPedido {
    public ProcessadorPedido() {

    }

    public void confirmarPedido(Pedido p) {
        if(p.status != StatusPedido.CARRINHO || p.naoPossuiItens()){
            System.debug('Não é possível confirmar um pedido sem itens ou com status diferente de carrinho.');
            return;
        }
        p.alterarStatus(StatusPedido.EM_PROCESSAMENTO);
    }

    public void cancelarPedido(Pedido p){
        if(p.status != StatusPedido.CARRINHO || p.naoPossuiItens()){
            System.debug('Não é possível cancelar um pedido sem itens ou com status diferente de carrinho.');
            
            return;
        }        
        p.alterarStatus(StatusPedido.CANCELADO);
    }

    public void adicionarPedido(Pedido p,Produto produto, Integer quantidade, PoliticaDePreco politicaDePreco){
        buscarProdutoEmRestaurante(p, produto);

        invariantesObrigatorias(p, quantidade);

        p.adicionarItemPedido(produto, quantidade, politicaDePreco);
        
    }

    public void alterarQuantidadeItemPedido(Pedido p,Produto produto, Integer novaQuantidade){
        invariantesObrigatorias(p, novaQuantidade);
        p.alterarQuantidadeItemPedido(produto, novaQuantidade);
    }


    private void invariantesObrigatorias(Pedido p, Integer quantidade ){
        if(p.nome == null) throw new IllegalArgumentException('Produto sem nome.');
        if(p.precoBase.valor == null || p.precoBase.valor <= 0) throw new IllegalArgumentException('Produto com preço inválido.');
        if(quantidade == null || quantidade <= 0) throw new IllegalArgumentException('Quantidade inválida para um item do pedido.');
    }
    
    private void buscarProdutoEmRestaurante(Pedido p, Produto produto){
        if(p.restaurante.buscarProdutos(produto.nome).isEmpty()){
            System.debug('Produto ' + produto.nome + ' não disponível no restaurante ' + p.restaurante.nome);
            return;
        }
    }

    


    

}