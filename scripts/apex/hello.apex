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
Restaurante base = new Restaurante('Bella Pizza','Av antartico 381', CategoriaRestaurante.PIZZARIA);
Produto produto1 = new Produto('Pizza de Calabresa', 38.00);
Produto produto2 = new Produto('Pizza de Mussarela', 35.00);
Produto produto3 = new Produto('Refrigerante', 8.00);
Produto produto4 = new Produto('Pastel', 6.50);
Cliente cliente1 = new Cliente('Ana','Rua Central 123','(11)99999-9999','123,456,789-00');

base.adicionarProduto(produto1);
base.adicionarProduto(produto2);
base.adicionarProduto(produto3);

Pedido pedido1 = new Pedido(cliente1, base);
pedido1.adicionarItemPedido(produto4, 1);
pedido1.adicionarItemPedido(produto1, 1);
pedido1.exibirResumo();
pedido1.confirmarPedido();
pedido1.exibirResumo();






