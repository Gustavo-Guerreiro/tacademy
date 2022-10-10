package exercicio03;

public class Data {
    private int dia;
    private int mes;
    private int ano;

    public Data(String data){
        String[] dataArray = data.split("/");
        
        int mes = Integer.parseInt(dataArray[1]);
        int ano = Integer.parseInt(dataArray[2]);
        int dia = Integer.parseInt(dataArray[0]);

        setAno(ano);
        setMes(mes);
        setDia(dia);
    }    

    public int ano(){
        if (this.mes == 1 && this.dia == 1){
            return this.ano-1;
        } else {
            return this.ano;
        }
    }

    public int mes(){
        if (this.dia == 1){
            if (this.mes==1){
                return 12;
            } else {
                return this.mes-1;
            }
        } else {
            return this.mes;
        }
    }

    public int dia(){
        if (this.dia == 1){
            switch (mes()){
                case 2:
                    if ((this.ano % 400 == 0) || ((ano % 4 == 0) && (ano % 100 != 0))){
                        return 29;
                    } else {
                        return 28;
                    }
                case 4:
                case 6:
                case 9:
                case 11:
                    return 30;
                default:
                    return 31;
            }
        } else {
            return dia-1;
        }
    }

    public String getDiaAnterior() {
        if (this.dia != -1 && this.mes != -1 && this.ano != -1){
            return String.format("%02d", this.dia())  + "/"
                + String.format("%02d", this.mes()) + "/" + this.ano();
        } else {
            return "Data Inválida";
        }
    }


    public int getDia() {
        return this.dia;
    }

    public void setDia(int dia) {
        if (dia>0 && dia < 32){
            switch(this.mes) {
                case 2:
                    if ((this.ano % 400 == 0) || ((ano % 4 == 0) && (ano % 100 != 0))){
                        if (dia > 29){
                            this.dia = -1;
                            break;
                        } else {
                            this.dia = dia;
                        }
                    } else {
                        if (dia > 28){
                            this.dia = -1;
                            break;
                        } else {
                            this.dia = dia;
                        }
                    }
                    break;
                case 4:
                case 6:
                case 9:
                case 11:
                    if(dia > 30) {
                        this.dia = -1;
                    } else {
                        this.dia = dia;
                    }
                default:
                    this.dia = dia;
                    break;
            }
        } else {
            this.dia = -1;
        }
    }

    public int getMes() {
        return this.mes;
    }

    public void setMes(int mes) {
        if (mes > 0 && mes < 13){
            this.mes = mes;
        }
    }

    public int getAno() {
        return this.ano;
    }

    public void setAno(int ano) {
        if(ano > 1900 && ano < 2100 ){
            this.ano = ano;
        }
    }

}