public with sharing class Pedido {
    public Cliente cliente{get; private set;}
    public Restaurante restaurante{get; private set;}
    public List<ItemPedido> itens{get; private set;}
    public StatusPedido status{get; private set;}
    public Decimal total{get; private set;}


    public Pedido(Cliente cliente, Restaurante restaurante) {
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.itens = new List<ItemPedido>();
        this.status = StatusPedido.CARRINHO;
        this.total = 0.0;
    }

    public void adicionarItemPedido(Produto produto, Integer quantidade) {
        if(restaurante.buscarProdutos(produto.nome).isEmpty()){
            System.debug('Produto ' + produto.nome + ' não disponível no restaurante ' + restaurante.nome);
            return;
        }

        ItemPedido itemExistente = buscarItemNoPedido(produto.nome);
        
        if(itemExistente == null){
            adicionarNovoItem(produto, quantidade);
            System.debug('Produto ' + produto.nome + ' adicionado ao pedido com quantidade ' + quantidade);
            return;
        }else {
            itemExistente.adicionarQuantidade(quantidade);
            calcularTotal();
            System.debug('Quantidade do produto ' + produto.nome + ' atualizada para ' + itemExistente.quantidade);
        }
    }    

    public void confirmarPedido() {
        if(status != StatusPedido.CARRINHO || itens.isEmpty()){
            System.debug('Não é possível confirmar um pedido sem itens ou com status diferente de carrinho.');
            return;
        }
        alterarStatus(StatusPedido.EM_PROCESSAMENTO);
    }

    public void exibirResumo(){
        System.debug('Resumo do pedido:');
        System.debug('Cliente: ' + cliente.nome);
        System.debug('Restaurante: ' + restaurante.nome);
        System.debug('Itens do pedido:');
        for (ItemPedido item : itens) {
            System.debug('- ' + item.produto.nome + ' x' + item.quantidade + ' - Subtotal: R$' + item.subtotal.setScale(2));
        }
        System.debug('Total: R$' + total.setScale(2));
        System.debug('Status: ' + status);
    }


	private void calcularTotal(){
		Decimal total = 0.0;
		for(ItemPedido item : itens){
			total += item.subtotal;
		}
		this.total = total;
	}
    
    private void adicionarNovoItem(Produto produto, Integer quantidade){
        ItemPedido novoItem = new ItemPedido(produto, quantidade);
        itens.add(novoItem);
        calcularTotal();
    }

    private ItemPedido buscarItemNoPedido(String nomeProduto) {
    for (ItemPedido item : itens) {
        if (item.produto.nome.equalsIgnoreCase(nomeProduto)) {
            return item;
        }
    }
    return null; 
    }

    private void alterarStatus(StatusPedido novoStatus) {
    this.status = novoStatus;
    System.debug('Status do pedido atualizado para: ' + novoStatus);
}


}