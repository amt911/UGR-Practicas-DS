import javax.swing.JPanel;

public class VelocimetroAntiguo extends JPanel{
    private double velocidad;

    public VelocimetroAntiguo(){
        velocidad=0;
    }

    public double getVelocidad(){
        return velocidad;
    }
    
    public void calcularVelocidad(double radio, double revs){
        velocidad=2*Math.PI*radio*revs*0.06;
    }
}