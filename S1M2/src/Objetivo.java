import javax.swing.JPanel;

public class Objetivo extends JPanel{
	private EstadoMotor _tiene;
	private VelocimetroAntiguo velocidad;
	private CuentaKilometrosAntiguo distancia;
	private CuentaRevolucionesAntiguo revs;
	final private double RADIO;	//Se pone de instancia por si se quiere crear otra con otros parametros

	public Objetivo(){
		RADIO=0.15;
		_tiene=EstadoMotor.APAGADO;
		velocidad=new VelocimetroAntiguo();
		distancia=new CuentaKilometrosAntiguo();
		revs=new CuentaRevolucionesAntiguo();
	}

	public Objetivo(double rads){
		RADIO=(rads>0)?rads:0.1;

		_tiene=EstadoMotor.APAGADO;
		velocidad=new VelocimetroAntiguo();
		distancia=new CuentaKilometrosAntiguo();
		this.revs=new CuentaRevolucionesAntiguo();		
	}

	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {
		revs.setRevs(aRevoluciones);

		_tiene=aEstadoMotor;
		//distancia+=2*3.14*radio*revs;
		distancia.addDistancia(2*Math.PI*RADIO*revs.getRevs());	//MEJORABLE

		//velocidad=2*3.14*radio*revs*0.06;
		velocidad.calcularVelocidad(RADIO, revs.getRevs());	//MEJORABLE

		System.out.println("#################################################");
		System.out.println("Revs: "+revs.getRevs());
		System.out.println("Distancia recorrida: "+distancia.getDistancia());
		System.out.println("Velocidad actual: "+velocidad.getVelocidad());
		System.out.println("Estado motor: "+_tiene);
		System.out.println("#################################################");

		return  revs.getRevs();	//ARREGLAR ESTE RETURN, NO SE EXACTAMENTE QUE TIENE QUE DEVOLVER
	}


	//Seguramente esto que haga sea un insulto para todos los programadores del mundo
	public double getRevs(){
		return revs.getRevs();
	}

        
        public EstadoMotor getEstado(){
            return _tiene;
        }
}