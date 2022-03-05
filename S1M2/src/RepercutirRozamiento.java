public class RepercutirRozamiento implements Filtro {
	public final int ROZAMIENTO;

	public RepercutirRozamiento(){
		ROZAMIENTO=-37;
	}

	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {

		if((aRevoluciones+ROZAMIENTO)<=0)
			return 0;

		else
			return aRevoluciones+ROZAMIENTO;	//Hay que comprobar esto
	}
}