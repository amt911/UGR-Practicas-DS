import javax.swing.JPanel;

public class CuentaRevoluciones extends JPanel{
    private double revs;

    public CuentaRevoluciones(){
        revs=0;
    }

    public double getRevs(){
        return revs;
    }

    public void setRevs(double nuevo){
        revs=nuevo;
    }
}