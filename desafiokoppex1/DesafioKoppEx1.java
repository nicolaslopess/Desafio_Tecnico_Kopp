package desafiokoppex1;

public class DesafioKoppEx1 {

    public static void main(String[] args) {

        Valores valor = new Valores();
        valor.ordem();

        System.out.println("Remessa gerada: ");
        for (int i = 0; i < valor.lista.size(); i++) {
            System.out.println(valor.contador[i] + " Cujo valor é R$ " + valor.lista.get(i));
        }
        valor.soma();

        System.out.println("total = R$" + valor.soma);
    }
}
