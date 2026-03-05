public with sharing class Documento {

    public String documento{get; private set;}
    
    
    public Documento(String documento) {
        this.documento = documento;
    }

    public Boolean equals(Object obj) {
        if (obj instanceof Documento) {
            Documento other = (Documento) obj;
            return this.documento == other.documento;
        }
        return false;
    }

    public Integer hashCode() {
        return this.documento.hashCode();
    }
}

    