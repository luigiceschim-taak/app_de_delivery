public with sharing class RelatorioService {

    public class RelatorioItem implements Comparable {
        public String nomeProduto {get; private set;}
        public Integer quantidadeVendida {get; private set;}

        public RelatorioItem(String nomeProduto, Integer quantidadeVendida) {
            this.nomeProduto = nomeProduto;
            this.quantidadeVendida = quantidadeVendida;
        }

        public Integer compareTo(Object obj) {
            RelatorioItem outroItem = (RelatorioItem) obj;
            
            if(this.quantidadeVendida == outroItem.quantidadeVendida) {
                return this.nomeProduto.toLowerCase().compareTo(outroItem.nomeProduto.toLowerCase());
                
            }else if(this.quantidadeVendida < outroItem.quantidadeVendida) {
                return 1; 

            }else{
                return -1; 
            }
        }
    }
    
    public static Map<Produto, Integer> gerarRelatorioPedidos(List<Pedido> pedidos) {
        // Lógica para gerar relatório de pedidos
        Map<Produto, Integer> relatorio = new Map<Produto, Integer>();

        for (Pedido pedido : pedidos) {
            for(ItemPedido item : pedido.i){
                Integer quantidadeAtual = relatorio.containsKey(item.produto) ? relatorio.get(item.produto) : 0;
                relatorio.put(item.produto, quantidadeAtual + item.quantidade);  
            }
        }
        List<RelatorioItem> listaOrdenada = new List<RelatorioItem>();
        for(Produto produto : relatorio.keySet()) {
            listaOrdenada.add(new RelatorioItem(produto.nome, relatorio.get(produto)));
        }
        listaOrdenada.sort();
        System.debug('----TOP 3 PRODUTOS----:');
        
        // Exibe os 3 produtos mais vendidos e controla o out of bounds caso haja menos de 3 produtos.
    
        for(Integer i = 0; i < listaOrdenada.size() && i < 3; i++) {
            System.debug((i+1) + '. ' + listaOrdenada[i].nomeProduto + ' - Quantidade vendida: ' + listaOrdenada[i].quantidadeVendida);
           
        }
        
        
        return relatorio;
    }
    
    public RelatorioService() {

    }

    public static Map<String, List<Pedido>> gerarRelatorioPedidosPorCliente(List<Pedido> pedidos, List<String> cpfs){
        Map<String, List<Pedido>> relatorio = new Map<String, List<Pedido>>();

        for(Pedido p : pedidos){
            for(String cpf : cpfs){
                if(p.cliente.cpf == cpf) {
                    List<Pedido> pedidosCliente = relatorio.containsKey(cpf) ? relatorio.get(cpf) : new List<Pedido>();
                    pedidosCliente.add(p);
                    relatorio.put(cpf, pedidosCliente);
                }
            }
            
        }

            System.debug('Relatório de pedidos por cliente:');  
            for(String cpf : relatorio.keySet()){
                List<Pedido> pedidosCliente = relatorio.get(cpf);
                System.debug('CPF: ' + cpf + ' - Total de pedidos: ' + pedidosCliente.size());
            }
            return relatorio;


        
    }

}