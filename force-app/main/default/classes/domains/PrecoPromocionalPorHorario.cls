public with sharing class PrecoPromocionalPorHorario implements PoliticaDePreco {
    public PrecoPromocionalPorHorario() {

    }

    public Dinheiro calcularPreco(Produto produto) {
        DateTime inicio = DateTime.now();
        DateTime finalTime = inicio.addHours(3); 
        
        if(DateTime.now() >= inicio && DateTime.now() <= finalTime) {
            return new Dinheiro(produto.precoBase.valor * 0.8); // Aplicando 20% de desconto
        }
        
        return new Dinheiro(produto.precoBase.valor);
    }
}