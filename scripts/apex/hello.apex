Restaurante base = new Restaurante('Base', 'Rua A, 123', CategoriaRestaurante.PIZZARIA);



Produto mussarela = new Produto('Pizza de mussarela', new Dinheiro(20));
Produto refrigerante = new Produto('Refrigerante', new Dinheiro(5));


Endereco end1 = new Endereco('casa1','122', 'sp');
Documento doc1 = new Documento('12132313123');

Cliente c1 = new Cliente('ana',end1,'1113112',doc1);


base.adicionarProduto(mussarela);
base.adicionarProduto(refrigerante);


Pedido p1 = new Pedido(c1,base);

p1.adicionarItemPedido(mussarela, 2, new PoliticaPrecoComDescontoPercentual());
p1.adicionarItemPedido(mussarela, 1, new PrecoPromocionalPorHorario());
p1.adicionarItemPedido(produto, quantidade, politicaDePreco)


System.debug(p1.getItensCopia());
