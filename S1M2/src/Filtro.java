public interface Filtro {
	public static final int MAX_REVS=5000;
	public double ejecutar(double aRevoluciones, EstadoMotor aEstadoMotor);
}