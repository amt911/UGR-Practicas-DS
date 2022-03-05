import javax.swing.JPanel;

public class Objetivo extends JPanel{
	public EstadoMotor _tiene;
	//private double velocidad;
	private Velocimetro velocidad;
	//private double distancia;
	private CuentaKilometros distancia;
	//public double revs;
	public 
	final private double radio=0.15;
	//final public int MAX_REVS=5000;

	public Objetivo(){
		_tiene=EstadoMotor.APAGADO;
		//velocidad=0;
		velocidad=new Velocimetro();
		//distancia=0;
		distancia=new CuentaKilometros();

		revs=0;
	}
	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {
		//throw new UnsupportedOperationException();
		revs=aRevoluciones;
		_tiene=aEstadoMotor;
		//distancia+=2*3.14*radio*revs;
		distancia.addDistancia(2*3.14*radio*revs);	//MEJORABLE

		//velocidad=2*3.14*radio*revs*0.06;
		velocidad.calcularVelocidad(radio, revs);


		System.out.println("Revs: "+revs);
		System.out.println("\nDistancia recorrida: "+distancia.getDistancia());
		System.out.println("\nVelocidad actual: "+velocidad.getVelocidad());

		return  5.6;	//ARREGLAR ESTE RETURN, NO SE EXACTAMENTE QUE TIENE QUE DEVOLVER
	}
}