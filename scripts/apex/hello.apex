// 1. Instancia o objeto de valor para o preço
Dinheiro precoInicial = new Dinheiro(100.00);

// 2. Instancia a estratégia de preço (ex: uma implementação de desconto)
PoliticaDePreco minhaPolitica = new PrecoPromocionalPorHorario();

Produto meuProduto = new Produto('Produto A', precoInicial, minhaPolitica);
System.debug(meuProduto);
System.debug('Preço calculado: ' + meuProduto.calcularPrecoFinal());

