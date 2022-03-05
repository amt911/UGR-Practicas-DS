public class CalcularVelocidad implements Filtro {
	private int incrementoVelocidad;

	public CalcularVelocidad(){
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

		if((aRevoluciones+incrementoVelocidad)>=MAX_REVS || (aRevoluciones+incrementoVelocidad)<=0)
			incrementoVelocidad=0;

		return aRevoluciones+incrementoVelocidad;
	}
}