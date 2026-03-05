public with sharing class ProcessadorPedido {
    public ProcessadorPedido() {

    }

    public void confirmarPedido(Pedido p) {
        validarEstadoParaAlteracao(p);
        
       
        p.alterarStatus(StatusPedido.EM_PROCESSAMENTO);
    }

    public void cancelarPedido(Pedido p){
        validarEstadoParaAlteracao(p);
        
        p.alterarStatus(StatusPedido.CANCELADO);
    }

    public void adicionarPedido(Pedido pedido,Produto produto, Integer quantidade, PoliticaDePreco politicaDePreco){
        buscarProdutoEmRestaurante(pedido, produto);
        invariantesObrigatorias(produto, quantidade);
        
        validarNaoEstaNoCarrinho(pedido);

        pedido.adicionarItemPedido(produto, quantidade, politicaDePreco); 
    }

    public void removerPedido(Pedido pedido, Produto produto){
        itensEstaVazio(pedido);
        
        pedido.removerItemPedido(produto);
    }

    public void alterarQuantidadeItemPedido(Pedido p,Produto produto, Integer novaQuantidade){
        invariantesObrigatorias(produto, novaQuantidade);
        p.alterarQuantidadeItemPedido(produto, novaQuantidade);
    }
   
    public void adicionarQuantidadeItemPedido(Pedido p,Produto produto, Integer novaQuantidade){
        invariantesObrigatorias(produto, novaQuantidade);
        p.adicionarQuantidadeItemPedido(produto, novaQuantidade);
    }

    private void validarEstadoParaAlteracao(Pedido p){
         if(p.naoEstaNoCarrinho() || p.estaVazio()){
            System.debug('Não é possível progredir com a ação, pois carrinho ou pedido está vázio');
            return;
        }
    }

    private void validarNaoEstaNoCarrinho(Pedido p){
        if(p.naoEstaNoCarrinho()){
            System.debug('Não é possível progredir com a ação, pedido não está no carrinho');
            return;
        }
    }

    private void itensEstaVazio(Pedido p){
        if(p.estaVazio()){
            System.debug('Lista de itens está vazia');
            return;
        }
    }


    private void invariantesObrigatorias(Produto produto, Integer quantidade ){
        if(produto.nome == null) throw new IllegalArgumentException('Produto sem nome.');
        if(produto.precoBase.valor == null || produto.precoBase.valor <= 0) throw new IllegalArgumentException('Produto com preço inválido.');
        if(quantidade == null || quantidade <= 0) throw new IllegalArgumentException('Quantidade inválida para um item do pedido.');
    }
    
    private void buscarProdutoEmRestaurante(Pedido p, Produto produto){
        if(p.restaurante.buscarProdutos(produto.nome).isEmpty()){
            System.debug('Produto ' + produto.nome + ' não disponível no restaurante ' + p.restaurante.nome);
            return;
        }
    }

    


    

}