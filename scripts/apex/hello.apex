Restaurante base = new Restaurante('Bella Pizza','Av antartico 381', CategoriaRestaurante.PIZZARIA);
Produto produto1 = new Produto('Pizza de Calabresa', 38.00);
Produto produto2 = new Produto('Pizza de Mussarela', 35.00);
Produto produto3 = new Produto('Refrigerante', 8.00);
Produto produto4 = new Produto('Pastel', 6.50);

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
base.adicionarProduto(produto1);
base.adicionarProduto(produto2);
base.adicionarProduto(produto3);
base.adicionarProduto(produto4);
base.buscarProdutos('Pizza');
base.buscarProdutos('calabresa');
base.buscarProdutos('batata');

