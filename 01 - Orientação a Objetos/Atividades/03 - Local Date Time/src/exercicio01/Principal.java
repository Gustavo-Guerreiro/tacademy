package exercicio01;

import java.time.LocalDateTime;

public class Principal {
    public static void main(String[] args) {
        LocalDateTime tempo = LocalDateTime.now();

        String data = String.format("%02d", tempo.getDayOfMonth()) + "/" 
                    + String.format("%02d", tempo.getMonthValue()) + "/"
                    + tempo.getYear() + " - "
                    + String.format("%02d", tempo.getHour()) + ":"
                    + String.format("%02d", tempo.getMinute());

        System.out.println(data);

        System.out.println(tempo.getHour() + " horas e " + tempo.getMinute() + " minutos.");
    }
}