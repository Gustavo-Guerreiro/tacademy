package exercicio02;

public class Aplicacao {
    private float valorInvestido;
    private int tempo;
    private double taxaJuros;

    public Aplicacao(float valorInvestido, int tempo, double taxaJuros){
        setValorInvestido(valorInvestido);
        setTaxaJuros(taxaJuros);
        setTempo(tempo);
    }

    public double calcularTaxaMensal(){
        if (tempo > 0){
            return this.taxaJuros / 12;
        } else {
            return 0;
        }
    }

    public String preverRendimentos(){
        float total = this.valorInvestido;
        float valorGanho = 0;
        String retorno = "";
        for (int i = 0; i < this.tempo; i++) {
            valorGanho = (float) (calcularTaxaMensal()/100) * total;
            total += (calcularTaxaMensal()/100)* valorInvestido;
            retorno += "Mês: " + (i+1) +"º mês \n"
                     + "Valor Ganho no Mês: R$ " + String.format("%.2f", valorGanho)  +" \n"
                     + "Total da Aplicação: R$ " + String.format("%.2f", total) + " \n";
        }
        return retorno;
    }

    public float getValorInvestido() {
        return this.valorInvestido;
    }

    public void setValorInvestido(float valorInvestido) {
        if (valorInvestido > 0){
            this.valorInvestido = valorInvestido;
        }
    }

    public int getTempo() {
        return this.tempo;
    }

    public void setTempo(int tempo) {
        if (tempo > 0){
            this.tempo = tempo;
        }
    }

    public double getTaxaJuros() {
        return this.taxaJuros;
    }

    public void setTaxaJuros(double taxaJuros) {
        if (taxaJuros > 0){
            this.taxaJuros = taxaJuros;
        }
    }
    
}