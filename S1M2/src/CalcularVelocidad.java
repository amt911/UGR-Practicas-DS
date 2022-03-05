public class CalcularVelocidad implements Filtro {
	private double incrementoVelocidad;
	private final double MAX_REVS;

	public CalcularVelocidad(){
		incrementoVelocidad=0;
		MAX_REVS=5000;
	}

	public CalcularVelocidad(double max){
		MAX_REVS=(max>0)?max:5000;

		incrementoVelocidad=0;
	}


	//Este metodo devuelve las revoluciones del coche despues de aplicar el filtro
	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {

		switch(aEstadoMotor){
			case ACELERANDO:
				incrementoVelocidad=100;
				break;

			case FRENANDO:
				incrementoVelocidad=-100;
				break;

			default:
				incrementoVelocidad=0;
				break;
		}

		//En caso de que se supere el maximo, simplemente se llega al mismo
		if((aRevoluciones+incrementoVelocidad)>MAX_REVS)
			incrementoVelocidad=MAX_REVS-aRevoluciones;
		
		else if((aRevoluciones+incrementoVelocidad)<=0)
			incrementoVelocidad=0;

		return aRevoluciones+incrementoVelocidad;
	}
}