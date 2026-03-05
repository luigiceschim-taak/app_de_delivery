public with sharing class Endereco {

    public String logradouro{get; private set;}
    public String numero{get; private set;}
    public String cidade{get; private set;}

    public Endereco(String logradouro, String numero, String cidade) {
        this.logradouro = logradouro;
        this.numero = numero;
        this.cidade = cidade;
    }
    public Boolean equals(Object obj) {
        if (this === obj) return true;
        if (obj == null || !(obj instanceof Endereco)) return false;
        Endereco other = (Endereco) obj;
        return logradouro == other.logradouro &&
               numero == other.numero &&
               cidade == other.cidade;
    }

    public Integer hashCode() {
        return (logradouro + numero + cidade).hashCode();
    }
}

    