public abstract with sharing class Pessoa extends EntidadeBase {
    public String nome{get; private set;}
    public Documento documento{get; private set;}
    
    public Pessoa(String nome, Documento documento) {
        super();
        validarNome(nome);
        this.nome = nome;
        this.documento = documento;

    }

    public abstract String getTipoPessoa();

    private void validarNome(String nome){
        if(String.isBlank(nome)){
            throw new IllegalArgumentException('O nome não pode ser vazio');
        }
    }
}