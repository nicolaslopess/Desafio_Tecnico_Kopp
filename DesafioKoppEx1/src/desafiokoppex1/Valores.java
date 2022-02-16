package desafiokoppex1;

import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;

public class Valores {

    List<Double> lista = new ArrayList<>(Arrays.asList(88.00, 130.00, 54.90, 293.30, 44.80));
    int[] contador = new int[lista.size()];
    double soma;

    void ordem() {

        for (int i = 0; i < lista.size(); i++) {
            if (i == 0) {
                contador[i] = contador[i] + 1;
            } else {
                contador[i] = contador[i - 1] + 1;
            }

        }

    }

    void soma() {
        for (int i = 0; i < lista.size(); i++) {
            soma += lista.get(i);
        }
    }
}
