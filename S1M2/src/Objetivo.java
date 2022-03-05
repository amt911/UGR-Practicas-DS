import javax.swing.JPanel;

public class Objetivo extends JPanel{
	private EstadoMotor _tiene;
	//private double velocidad;
	private Velocimetro velocidad;
	//private double distancia;
	private CuentaKilometros distancia;
	//public double revs;
	private CuentaRevoluciones revs;
	final private double radio=0.15;
	//final public int MAX_REVS=5000;

	public Objetivo(){
		_tiene=EstadoMotor.APAGADO;
		//velocidad=0;
		velocidad=new Velocimetro();
		//distancia=0;
		distancia=new CuentaKilometros();

		//revs=0;
		revs=new CuentaRevoluciones();
	}
	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {
		//throw new UnsupportedOperationException();
		//revs=aRevoluciones;
		revs.setRevs(aRevoluciones);

		_tiene=aEstadoMotor;
		//distancia+=2*3.14*radio*revs;
		distancia.addDistancia(2*3.14*radio*revs.getRevs());	//MEJORABLE

		//velocidad=2*3.14*radio*revs*0.06;
		velocidad.calcularVelocidad(radio, revs.getRevs());


		System.out.println("Revs: "+revs.getRevs());
		System.out.println("\nDistancia recorrida: "+distancia.getDistancia());
		System.out.println("\nVelocidad actual: "+velocidad.getVelocidad());
		System.out.println("\nEstado motor: "+_tiene);

		return  5.6;	//ARREGLAR ESTE RETURN, NO SE EXACTAMENTE QUE TIENE QUE DEVOLVER
	}

	public CuentaRevoluciones getRevs(){
		return revs;
	}
}