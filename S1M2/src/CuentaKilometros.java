import javax.swing.JPanel;

public class CuentaKilometros extends JPanel{
    private double distancia;

    public CuentaKilometros(){
        distancia=0;
    }

    public double getDistancia(){
        return distancia;
    }

    public void addDistancia(double valor){
        distancia+=valor;
    }
}
