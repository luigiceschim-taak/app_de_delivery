public with sharing class Cliente {

    public String nome{get; private set;}
    public String endereco{get;private set;}
    public String telefone{get;private set;}
    public String cpf{get;private set;}


    public Cliente() {

    }

    public Cliente(String nome, String endereco, String telefone, String cpf) {
        this.nome = nome;
        this.endereco = endereco;
        this.telefone = telefone;
        this.cpf = cpf;
    }




}