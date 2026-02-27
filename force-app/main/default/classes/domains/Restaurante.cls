public with sharing class Restaurante {

    public String nome{get; private set;}
    public String endereco{get; private set;}
    public CategoriaRestaurante categoria{get; private set;}
    
    public List<Produto> cardapio{get; private set;}
    
    public Restaurante() {

    }

    public Restaurante(String nome, String endereco, CategoriaRestaurante categoria) {
        this.nome = nome;
        this.endereco = endereco;
        this.categoria = categoria;
        this.cardapio = new List<Produto>();
    }

    public void adicionarProduto(Produto produto){
        for (Produto p : cardapio) {
            if (p.nome == produto.nome) {
                System.debug('Produto já existe no cardápio');
                return;
                
            }

              
        }
        cardapio.add(produto);
        System.debug('Produto adicionado ao cardápio');
    }

    public void exibirCardapio(){
        if(cardapio.isEmpty()){
            System.debug('Cardápio vazio');
            return;
        }
        System.debug('Cardápio do restaurante ' + nome + ':');
        Integer counter = 1;
        for (Produto p : cardapio) {
            System.debug(counter + ' - ' + p.nome + ' R$' + p.preco);
            counter++;
        }
    }

    public List<Produto> buscarProdutos(String termoBusca) {
        List<Produto> resultados = new List<Produto>();
        for (Produto p : cardapio) {
            if (p.nome.containsIgnoreCase(termoBusca)) {
                resultados.add(p);
                System.debug(p.nome + ' – R$' + p.preco.setScale(2));
            }
        }
        if(resultados.isEmpty()){
            System.debug('Nenhum produto encontrado para: ' + termoBusca);
        }
        
        return resultados;
    }


}