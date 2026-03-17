Restaurante base = new Restaurante('Base', 'Rua A, 123', CategoriaRestaurante.PIZZARIA);



Produto mussarela = new Produto('Pizza de mussarela', new Dinheiro(20));
Produto refrigerante = new Produto('Refrigerante', new Dinheiro(5));


Endereco end1 = new Endereco('casa1','122', 'sp');
Documento doc1 = new Documento('12132313123');

Cliente c1 = new Cliente('ana',end1,'111312',doc1);


base.adicionarProduto(mussarela);
base.adicionarProduto(refrigerante);


Pedido p1 = new Pedido(c1,base);

ProcessadorPedido processador = new ProcessadorPedido(new FreteFixo());

processador.adicionarPedido(p1, mussarela, 3, new PoliticaPrecoComDescontoPercentual());
processador.adicionarPedido(p1, refrigerante, 2, new PoliticaPrecoPadrao());
processador.confirmarPedido(p1);
processador.confirmarPedido(p1);



System.debug(p1.getItensCopia());
System.debug(p1);
