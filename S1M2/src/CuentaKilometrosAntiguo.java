import javax.swing.JPanel;

public class CuentaKilometrosAntiguo extends JPanel{
    private double distancia;

    public CuentaKilometrosAntiguo(){
        distancia=0;
    }

    public double getDistancia(){
        return distancia;
    }

    public void addDistancia(double valor){
        distancia+=valor;
    }
}
