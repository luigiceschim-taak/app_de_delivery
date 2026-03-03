// Restaurante base = new Restaurante('Bella Pizza','Av antartico 381', CategoriaRestaurante.PIZZARIA);
// Produto produto1 = new Produto('Pizza de Calabresa', 38.00);
// Produto produto2 = new Produto('Pizza de Mussarela', 35.00);
// Produto produto3 = new Produto('Refrigerante', 8.00);
// Produto produto4 = new Produto('Pastel', 6.50);


//teste adicionar produtos:
// base.adicionarProduto(produto2);
// base.adicionarProduto(produto2);
// base.adicionarProduto(produto3);
// base.exibirCardapio();

//teste exibir cardápio:
// base.exibirCardapio();
// base.adicionarProduto(produto1);
// base.adicionarProduto(produto3);
// base.exibirCardapio();

//testeBuscarProdutos:
// base.adicionarProduto(produto1);
// base.adicionarProduto(produto2);
// base.adicionarProduto(produto3);
// base.adicionarProduto(produto4);
// base.buscarProdutos('Pizza');
// base.buscarProdutos('calabresa');
// base.buscarProdutos('batata');



//testeCriarPedidoComProdutosValidos():
// Restaurante base = new Restaurante('Bella Pizza','Av antartico 381', CategoriaRestaurante.PIZZARIA);
// Produto produto1 = new Produto('Pizza de Calabresa', 38.00);
// Produto produto2 = new Produto('Pizza de Mussarela', 35.00);
// Produto produto3 = new Produto('Refrigerante', 8.00);
// Produto produto4 = new Produto('Pastel', 6.50);
// Cliente cliente1 = new Cliente('Ana','Rua Central 123','(11)99999-9999','123,456,789-00');

// base.adicionarProduto(produto1);
// base.adicionarProduto(produto2);
// base.adicionarProduto(produto3);

// Pedido pedido1 = new Pedido(cliente1, base);
// pedido1.adicionarItemPedido(produto2, 2);
// pedido1.adicionarItemPedido(produto3, 1);
// pedido1.exibirResumo();
// pedido1.confirmarPedido();
// pedido1.exibirResumo();

//testeCriarPedidoComProdutoInvalido():
// Restaurante base = new Restaurante('Bella Pizza','Av antartico 381', CategoriaRestaurante.PIZZARIA);
// Produto produto1 = new Produto('Pizza de Calabresa', 38.00);
// Produto produto2 = new Produto('Pizza de Mussarela', 35.00);
// Produto produto3 = new Produto('Refrigerante', 8.00);
// Produto produto4 = new Produto('Pastel', 6.50);
// Cliente cliente1 = new Cliente('Ana','Rua Central 123','(11)99999-9999','123,456,789-00');
// Cliente cliente2 = new Cliente('Carlos', '(11) 98888-7777 ', 'Rua das Flores, 45', '987.654.321-00');
// Cliente c3 = new Cliente('Julia', '(11) 97777-6666', 'Av. Brasil, 100', '111.222.333-44');


// base.adicionarProduto(produto1);
// base.adicionarProduto(produto2);
// base.adicionarProduto(produto3);

// Pedido pedido1 = new Pedido(cliente1, base);
// pedido1.adicionarItemPedido(produto2, 1);
// pedido1.adicionarItemPedido(produto1, 3);



// Pedido pedido2 = new Pedido(cliente2, base);
// pedido2.adicionarItemPedido(produto2, 1);
// pedido2.adicionarItemPedido(produto3, 1);




// Pedido pedido3 = new Pedido(c3, base);
// pedido3.adicionarItemPedido(produto2, 1);
// pedido3.adicionarItemPedido(produto4, 2);

// Pedido pedido4 = new Pedido(c3, base);
// pedido4.adicionarItemPedido(produto3, 2);

// List<Pedido> pedidos = new List<Pedido>();
// pedidos.add(pedido1);
// pedidos.add(pedido2);
// pedidos.add(pedido3);
// pedidos.add(pedido4);

// List<String> cpfs = new List<String>();
// cpfs.add(cliente1.cpf);
// cpfs.add(cliente2.cpf);
// cpfs.add(c3.cpf);

// RelatorioService.gerarRelatorioPedidos(pedidos);
// RelatorioService.gerarRelatorioPedidosPorCliente(pedidos,cpfs);


Produto p = new Produto('casquinha', 1.20);
Restaurante base = new Restaurante('Bella Pizza','Av antartico 381', CategoriaRestaurante.PIZZARIA);

Documento cpf = new Documento('123.456.789-00');

String logradouro = 'Rua Central';
String numero = '123';
String cidade = 'São Paulo';
Endereco endereco = new Endereco(logradouro, numero, cidade);

Cliente c = new Cliente('Ana', endereco, '(11)99999-9999', cpf);
System.debug(c);
base.adicionarProduto(p);

Pedido pedido1 = new Pedido(c, base);
pedido1.adicionarItemPedido(p, 2);

pedido1.exibirResumo();
pedido1.confirmarPedido();

pedido1.alterarQuantidadeItemPedido(p, 3);
pedido1.adicionarItemPedido(p, 2);
pedido1.exibirResumo();


System.debug(pedido1.getItensCopia());







