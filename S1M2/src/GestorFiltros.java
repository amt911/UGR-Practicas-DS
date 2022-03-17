public class GestorFiltros {
	private CadenaFiltros cadenaFiltros;

	public GestorFiltros(Salpicadero s) {
		cadenaFiltros = new CadenaFiltros(s);
	}

	public void addFilter(Filtro filtro) {
		cadenaFiltros.addFilter(filtro);
	}

	public void peticionFiltros(EstadoMotor estadoMotor) {
		cadenaFiltros.ejecutar(estadoMotor);
	}
}