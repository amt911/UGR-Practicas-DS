public class RepercutirRozamiento implements Filtro {
	private final int ROZAMIENTO;

	public RepercutirRozamiento(){
		ROZAMIENTO=-37;
	}

	public RepercutirRozamiento(int roz) {
		if (roz > 0)
			ROZAMIENTO = -10;

		else
			ROZAMIENTO = roz;
	}

	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {

		if((aRevoluciones+ROZAMIENTO)<=0)
			return 0;

		else
			return aRevoluciones+ROZAMIENTO;	//Hay que comprobar esto
	}
}