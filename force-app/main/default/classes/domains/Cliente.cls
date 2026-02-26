public with sharing class Cliente {

    private String nome{get; private set;}
    private String endereco{get;private set;}
    private String telefone{get;private set;}
    private String cpf{get;private set;}


    public Cliente() {

    }

    public Cliente(String nome, String endereco, String telefone, String cpf) {
        this.nome = nome;
        this.endereco = endereco;
        this.telefone = telefone;
        this.cpf = cpf;
    }




}