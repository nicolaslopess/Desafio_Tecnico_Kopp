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


    /*double[] n = new double[10];
    int[] contador = new int[n.length];

    void ordemValorManual() {
        for (int i = 0; i < 10; i++) {
            
            System.out.print("Incira um valor: ");
            Scanner sc = new Scanner(System.in);
            double s = sc.nextDouble();
            n[i] = s;
            System.out.println("con: " + contador[i] + " n : " + n[i]);
        }
    }

    void ordemValorFixo() {
        double[] nf = {88.00, 130.00, 54.90, 293.30, 44.80};
        for (int i = 0; i < nf.length; i++) {
            System.out.println("valor fixo: " + nf[i]);
        }

    }

    void soma() {
        double vSoma = 0;
        for (int i = 0; i < n.length; i++) {
            vSoma = vSoma + n[i];
        }
        System.out.println("Total: " + vSoma);
    }

    void junsao() {

    }*/
}
