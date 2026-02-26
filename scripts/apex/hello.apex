Cliente c = new Cliente('Luigi','rua dos santos', '34536321', '213113112');
System.debug(c);

Produto p1 = new Produto('Coca-cola', 5.00);
Produto p2 = new Produto('Pepsi', 4.50);
System.debug(p1);
System.debug(p2);

Restaurante r = new Restaurante('Restaurante do Zé', 'rua dos santos', CategoriaRestaurante.LANCHONETE);

r.cardapio.add(p1);
r.cardapio.add(p2);
System.debug(r);