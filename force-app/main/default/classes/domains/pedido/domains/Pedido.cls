public with sharing class Pedido extends EntidadeBase implements IPedidoAcoes{
    public Cliente cliente{get; private set;}
    public Restaurante restaurante{get; private set;}
    private Map<String, ItemPedido> itens{get; private set;}
    private EstadoPedido status{get; private set;}
    public Dinheiro frete{get; private set;}
    public Dinheiro total{get; private set;}


    public Pedido(Cliente cliente, Restaurante restaurante) {
        super();
        this.cliente = cliente;
        this.restaurante = restaurante;
        this.itens = new Map<String, ItemPedido>();
        this.status = new EstadoCarrinho();
        this.frete = new Dinheiro(0.0);
        this.total = new Dinheiro(0.0);
    }

    public void aplicarFrete(Dinheiro frete){
        this.frete = frete;
        this.total = this.total.somar(this.frete);
        System.debug('Frete aplicado: R$' + frete);

    }

    public void adicionarItemPedido(Produto produto, Integer quantidade, PoliticaDePreco politicaDePreco) {
        
        this.status.adicionarProduto(this, produto, quantidade, politicaDepreco);  
    }
    
    public void removerItemPedido(Produto produto) {
        this.status.removerProduto(this, produto);
    }

    public void alterarQuantidadeItemPedido(Produto produto, Integer novaQuantidade) {

        
        
        executarAlteracao(produto, novaQuantidade);
    }

    public void adicionarQuantidadeItemPedido(Produto produto, Integer novaQuantidade) {

        executarAdicao(produto,novaQuantidade);
        
        
    }
    public void confirmar(){
        this.status.confirmar(this);
        
    }
    public void cancelarPedido(){
        this.status.cancelar(this);
        
    }
    public void entregue(){
        this.status.marcarComoEntregue(this);
        
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

    public Boolean estaVazio() {
        return this.itens.isEmpty();
    }


    private void executarAlteracao(Produto produto, Integer novaQuantidade){
        if(itens.containsKey(produto.nome)) {
            itens.get(produto.nome).alterarQuantidade(novaQuantidade); 
            calcularTotal();
        }
        else {
            System.debug('Produto ' + produto.nome + ' não encontrado no pedido.');
        }
    }
    
    private void executarAdicao(Produto produto, Integer novaQuantidade){
        if(itens.containsKey(produto.nome)) {
            itens.get(produto.nome).adicionarQuantidade(novaQuantidade);
            calcularTotal();
        }
        else {
            System.debug('Produto ' + produto.nome + ' não encontrado no pedido.');
        }
    }

    public void removerItem(Produto produto){
        if(itens.containsKey(produto.nome)){
            itens.remove(produto.nome);
            calcularTotal();
            System.debug('Item removido do pedido.');
        } else {
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
    
    public void adicionarNovoItem(Produto produto, Integer quantidade, PoliticaDePreco politicaDePreco){
        Dinheiro precoUnitario = politicaDePreco.calcularPreco(produto);
        
        if(!itens.containsKey(produto.nome)) itens.put(produto.nome, new ItemPedido(produto, 0, precoUnitario ));
        ItemPedido item = itens.get(produto.nome);
        item.adicionarQuantidade(quantidade);
        item.atualizarPrecoUnitario(precoUnitario);
       
        calcularTotal();
    }
    
    public void confirmarPedidoPrivado(EstadoPedido estado){
        this.status = estado;
    }
    public void cancelarPedidoPrivado(EstadoPedido estado){
        this.status = estado;
    }
    public void marcarEntregue(EstadoPedido estado){
        this.status = estado;
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

