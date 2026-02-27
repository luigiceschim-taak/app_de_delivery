public with sharing class ItemPedido {

    public Produto produto{get; private set;}
    public Integer quantidade{get; private set;}
    public Decimal subtotal{get; private set;}
   
    public ItemPedido(Produto produto, Integer quantidade) {
        this.produto = produto;
        this.quantidade = quantidade;
        this.subtotal = calcularSubtotal();
    }

    public Decimal calcularSubtotal() {
        return (this.produto.preco * this.quantidade).setScale(2);
    }

    public void adicionarQuantidade(Integer novaQuantidade) {
        this.quantidade += novaQuantidade;
        this.subtotal = calcularSubtotal();
    }
}