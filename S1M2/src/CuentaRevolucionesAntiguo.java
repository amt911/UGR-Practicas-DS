import javax.swing.JPanel;

public class CuentaRevolucionesAntiguo extends JPanel{
    private double revs;

    public CuentaRevolucionesAntiguo(){
        revs=0;
    }

    public double getRevs(){
        return revs;
    }

    public void setRevs(double nuevo){
        revs=nuevo;
    }
}