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

    public void adicionarItemPedido(Produto produto, Integer quantidade, PoliticaDePreco politicaDePreco) {
        if(status != StatusPedido.CARRINHO){
            System.debug('Não é possível adicionar itens a um pedido que não esteja no carrinho.');
            return;
        }
        adicionarNovoItem(produto, quantidade, politicaDePreco);  
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

        validarEstadoParaAlteracao();
        
        executarAlteracao(produto, novaQuantidade);
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

    public Boolean naoPossuiItens(){
        return itens.isEmpty();
    }

    public void validarEstadoParaAlteracao(){
         if(status != StatusPedido.CARRINHO){
            System.debug('Não é possível alterar a quantidade de itens de um pedido que não esteja no carrinho.');
            return;
        }
    }

    public void executarAlteracao(Produto produto, Integer novaQuantidade){
        if(itens.containsKey(produto.nome)) {
            itens.get(produto.nome).alterarQuantidade(novaQuantidade); 
            calcularTotal();
        }
        else {
            System.debug('Produto ' + produto.nome + ' não encontrado no pedido.');
        }
    }

	private void calcularTotal(){
		Dinheiro acumulado = new Dinheiro(0.0);
		for(ItemPedido item : itens.values()){
			acumulado = acumulado.somar(item.subtotal);
		}
		this.total = acumulado;
	}
    
    private void adicionarNovoItem(Produto produto, Integer quantidade, PoliticaDePreco politicaDePreco){
        Dinheiro precoUnitario = politicaDePreco.calcularPreco(produto);
        
        if(!itens.containsKey(produto.nome)) itens.put(produto.nome, new ItemPedido(produto, 0, precoUnitario ));
        ItemPedido item = itens.get(produto.nome);
        item.adicionarQuantidade(quantidade);
        item.atualizarPrecoUnitario(precoUnitario);
       
        calcularTotal();
    }

    

    public void alterarStatus(StatusPedido novoStatus) {
        this.status = novoStatus;
        System.debug('Status do pedido atualizado para: ' + novoStatus);
    }
    

    public class ItemPedido {
        public Produto produto{get; private set;}
        public Integer quantidade{get; private set;}
        public Dinheiro subtotal{get; private set;}
        public Dinheiro precoUnitario{get; private set;}

        private ItemPedido(Produto produto, Integer quantidade, Dinheiro precoUnitario) {
            this.produto = produto;
            this.quantidade = quantidade;
            this.precoUnitario = precoUnitario;
            this.subtotal = calcularSubtotal();
        }

        private Dinheiro calcularSubtotal() {
            return new Dinheiro(this.precoUnitario.valor * quantidade);
        }

        private void atualizarPrecoUnitario(Dinheiro novoPreco) {
            this.precoUnitario = new Dinheiro(novoPreco.valor);
            this.subtotal = calcularSubtotal();
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

