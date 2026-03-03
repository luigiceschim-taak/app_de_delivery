public abstract with sharing class EntidadeBase {
    
    public String id{get; private set;}
    
    public EntidadeBase() {
        this.id = UUID.randomUUID().toString();
    }

    public Boolean equals(Object obj) {
        if (this === obj) return true;
        if (obj == null || !(obj instanceof EntidadeBase)) return false;
        EntidadeBase other = (EntidadeBase) obj;
        return this.id == other.id;
    }

    public Integer hashCode() {
        return this.id.hashCode();
    }

}
