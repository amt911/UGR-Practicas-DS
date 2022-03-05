public class Objetivo {
	public EstadoMotor _tiene;
	private double velocidad;
	private double distancia;
	public double revs;
	final private double radio=0.15;
	final public int MAX_REVS=5000;

	public Objetivo(){
		_tiene=EstadoMotor.APAGADO;
		velocidad=0;
		distancia=0;
		revs=0;
	}
	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {
		//throw new UnsupportedOperationException();
		revs=aRevoluciones;
		_tiene=aEstadoMotor;
		distancia+=2*3.14*radio*revs;
		velocidad=2*3.14*radio*revs*0.06;


		System.out.println("Revs: "+revs);
		System.out.println("\nDistancia recorrida: "+distancia);
		System.out.println("\nVelocidad actual: "+velocidad);

		return  5.6;	//ARREGLAR ESTE RETURN, NO SE EXACTAMENTE QUE TIENE QUE DEVOLVER
	}
}