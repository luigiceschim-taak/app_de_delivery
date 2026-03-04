public with sharing class Dinheiro {
    public Decimal valor{get; private set;}

    public Dinheiro(Decimal valor) {
        validarNegativo(valor);
        this.valor = valor.setScale(2);
    }

    public Dinheiro somar(Dinheiro outro) {
        return new Dinheiro(this.valor + outro.valor);
    }

    public Dinheiro subtrair(Dinheiro outro) {
        return new Dinheiro(this.valor - outro.valor);
    }

    public Dinheiro multiplicar(Decimal multiplicador) {
        return new Dinheiro(this.valor * multiplicador);
    }

    public Boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || !(obj instanceof Dinheiro)) return false;
        Dinheiro other = (Dinheiro) obj;
        return this.valor == other.valor;
    }

    public Integer hashCode() {
        return this.valor.hashCode();
    }

    private void validarNegativo(Decimal valor) {
        if (this.valor < 0) {
            throw new IllegalArgumentException('Valor não pode ser negativo');
        }
    }
}