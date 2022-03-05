import javax.swing.JPanel;

public class Objetivo extends JPanel{
	private EstadoMotor _tiene;
	private Velocimetro velocidad;
	private CuentaKilometros distancia;
	private CuentaRevoluciones revs;
	final private double RADIO=0.15;

	public Objetivo(){
		_tiene=EstadoMotor.APAGADO;
		velocidad=new Velocimetro();
		distancia=new CuentaKilometros();
		revs=new CuentaRevoluciones();
	}

	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {
		revs.setRevs(aRevoluciones);

		_tiene=aEstadoMotor;
		//distancia+=2*3.14*radio*revs;
		distancia.addDistancia(2*Math.PI*RADIO*revs.getRevs());	//MEJORABLE

		//velocidad=2*3.14*radio*revs*0.06;
		velocidad.calcularVelocidad(RADIO, revs.getRevs());


		System.out.println("Revs: "+revs.getRevs());
		System.out.println("\nDistancia recorrida: "+distancia.getDistancia());
		System.out.println("\nVelocidad actual: "+velocidad.getVelocidad());
		System.out.println("\nEstado motor: "+_tiene);

		return  revs.getRevs();	//ARREGLAR ESTE RETURN, NO SE EXACTAMENTE QUE TIENE QUE DEVOLVER
	}

	public CuentaRevoluciones getRevs(){
		return revs;
	}
}