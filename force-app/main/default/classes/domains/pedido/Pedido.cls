public with sharing class Pedido extends EntidadeBase{
    public Cliente cliente{get; private set;}
    public Restaurante restaurante{get; private set;}
    private Map<String, ItemPedido> itens{get; private set;}
    public StatusPedido status{get; private set;}
    public Dinheiro total{get; private set;}


    public Pedido(Cliente cliente, Restaurante restaurante) {
        super();
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.itens = new Map<String, ItemPedido>();
        this.status = StatusPedido.CARRINHO;
        this.total = new Dinheiro(0.0);
    }

    public void adicionarItemPedido(Produto produto, Integer quantidade) {

        invariantesObrigatorias(produto, quantidade);

        if(status != StatusPedido.CARRINHO){
            System.debug('Não é possível adicionar itens a um pedido que não esteja no carrinho.');
            return;
        }

        if(restaurante.buscarProdutos(produto.nome).isEmpty()){
            System.debug('Produto ' + produto.nome + ' não disponível no restaurante ' + restaurante.nome);
            return;
        }

        adicionarNovoItem(produto, quantidade);  
    }
    
    public void removerItemPedido(Produto produto) {
        if(status != StatusPedido.CARRINHO){
            System.debug('Não é possível remover itens de um pedido que não esteja no carrinho.');
            return;
        }

        if(itens.containsKey(produto.nome)){
            itens.remove(produto.nome);
            calcularTotal();
            System.debug('Item removido do pedido.');
        } else {
            System.debug('Produto ' + produto.nome + ' não encontrado no pedido.');
        }
    }

    public void alterarQuantidadeItemPedido(Produto produto, Integer novaQuantidade) {
        if(status != StatusPedido.CARRINHO){
            System.debug('Não é possível alterar a quantidade de itens de um pedido que não esteja no carrinho.');
            return;
        }
        if(itens.containsKey(produto.nome)) {
            itens.get(produto.nome).alterarQuantidade(novaQuantidade); 
            calcularTotal();
        }
        else {
            System.debug('Produto ' + produto.nome + ' não encontrado no pedido.');
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
        for (ItemPedido item : itens.values()) {
            System.debug('- ' + item.produto.nome + ' x' + item.quantidade + ' - Subtotal: R$ ' + item.subtotal);
        }
        System.debug('Total: R$' + total);
        System.debug('Status: ' + status);
    }

    public List<ItemPedido> getItensCopia() {
        return itens.values();
    }

    private void invariantesObrigatorias(Produto p, Integer quantidade ){
        if(p.nome == null) throw new IllegalArgumentException('Produto sem nome.');
        if(p.preco == null || p.preco <= 0) throw new IllegalArgumentException('Produto com preço inválido.');
        if(quantidade == null || quantidade <= 0) throw new IllegalArgumentException('Quantidade inválida para um item do pedido.');
    }


	private void calcularTotal(){
		Dinheiro acumulado = new Dinheiro(0.0);
		for(ItemPedido item : itens.values()){
			acumulado = acumulado.somar(item.subtotal);
		}
		this.total = acumulado;
	}
    
    private void adicionarNovoItem(Produto produto, Integer quantidade){
        if(!itens.containsKey(produto.nome)) itens.put(produto.nome, new ItemPedido(produto, 0));
        itens.get(produto.nome).adicionarQuantidade(quantidade);
        calcularTotal();
    }

    

    private void alterarStatus(StatusPedido novoStatus) {
        this.status = novoStatus;
        System.debug('Status do pedido atualizado para: ' + novoStatus);
    }

    public class ItemPedido {
        public Produto produto{get; private set;}
        public Integer quantidade{get; private set;}
        public Dinheiro subtotal{get; private set;}

        private ItemPedido(Produto produto, Integer quantidade) {
            this.produto = produto;
            this.quantidade = quantidade;
            this.subtotal = calcularSubtotal();
        }

        private Dinheiro calcularSubtotal() {
            return new Dinheiro(produto.preco * quantidade);
        }

        private void adicionarQuantidade(Integer novaQuantidade) {
            if(novaQuantidade != null && novaQuantidade > 0){
            this.quantidade += novaQuantidade;
            this.subtotal = calcularSubtotal();
            } else {
                System.debug('Quantidade inválida para adição. A quantidade deve ser maior que zero.');
            }
        }  

        private void alterarQuantidade(Integer novaQuantidade) {
            if(novaQuantidade != null && novaQuantidade > 0){
                this.quantidade = novaQuantidade;
                this.subtotal = calcularSubtotal();
            } else {
                System.debug('Quantidade inválida para alteração. A quantidade deve ser maior que zero.');
            }
        }
    }
}

