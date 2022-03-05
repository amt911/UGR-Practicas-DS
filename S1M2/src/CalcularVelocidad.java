public class CalcularVelocidad implements Filtro {
	public int incrementoVelocidad=0;
	//public final int MAX_REVS=5000;

	public CalcularVelocidad(){
		
	}


	//Este metodo devuelve las revoluciones del coche despues de aplicar el filtro
	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {
		//double res=0;
		switch(aEstadoMotor){
			case ACELERANDO:{
				//res=aRevoluciones+100;
				incrementoVelocidad=100;
					//incrementoVelocidad=0;
					
				break;
			}

			case FRENANDO:
				//res=aRevoluciones-100;
				incrementoVelocidad=-100;
				break;

			default:
				incrementoVelocidad=0;
				break;
		}

		if((aRevoluciones+incrementoVelocidad)>=MAX_REVS || (aRevoluciones+incrementoVelocidad)<=0)
			incrementoVelocidad=0;

		return aRevoluciones+incrementoVelocidad;
		//throw new UnsupportedOperationException();
	}
}