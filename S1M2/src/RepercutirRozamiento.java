public class RepercutirRozamiento implements Filtro {
	public final int ROZAMIENTO=-37;

	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor) {
		//throw new UnsupportedOperationException();

		if((aRevoluciones+ROZAMIENTO)<=0)
			return 0;

		else
			return aRevoluciones+ROZAMIENTO;	//Hay que comprobar esto
	}
}