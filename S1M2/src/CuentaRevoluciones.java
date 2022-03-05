import javax.swing.JPanel;

public class CuentaRevoluciones extends JPanel{
    private double revs;
    private static final int MAX_REVS=5000;

    public CuentaRevoluciones(){
        revs=0;
    }

    public double getRevs(){
        return revs;
    }

    public void setRevs(double nuevo){
        revs=nuevo;
    }

    public static int getMAX_REVS(){        //SEGURAMENTE SEA MUY CUTRE
        return MAX_REVS;
    }
}